package com.axjy.controller.sys;

import com.alibaba.druid.sql.visitor.functions.Char;
import com.axjy.pojo.generalCharge.ChargeRecord;
import com.axjy.pojo.sys.Role;
import com.axjy.pojo.sys.User;
import com.axjy.pojo.sys.UserGarden;
import com.axjy.pojo.sys.UserRole;
import com.axjy.service.generalCharge.ChargeRecordService;
import com.axjy.service.sys.BusinessService;
import com.axjy.service.sys.*;
import com.axjy.utils.*;
import com.axjy.vo.sys.DelUserVo;
import com.axjy.vo.sys.QueryUserVo;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.ShiroException;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Created by Joe on 2021/09/22 下午 12:03
 */
@Slf4j
@RestController
@RequestMapping("/sys")
@Transactional
public class UserController {
    @Resource
    private UserService userService;
    @Resource
    private UserGardenService userGardenService;
    @Resource
    private UserRoleService userRoleService;
    @Resource
    private BusinessService businessService;
    @Resource
    private RoleService roleService;
    @Resource
    private ChargeRecordService chargeRecordService;

    /**
     * 用户编辑页面
     * @return 逻辑页面
     */
    @GetMapping("/user/edit")
    public ModelAndView edit(){
        return new ModelAndView("sys/user/edit");
    }

    /**
     * 用户编辑页面提交控制器
     * @param user 页面参数
     * @return
     */
    @PostMapping("/user/edit")
    public Result edit(User user){
        //验证用户编码
        Integer count =  userService.findByCode(user.getUser_code(),Long.valueOf(String.valueOf(user.getId())));
        if(count>0){
            return Result.failed("用户编码已存在");
        }
        try {
            //加密密码
            //对密码进行加密
            String hash = Utils.toMd5(user.getUserPassword(),Utils.get4Word());
            user.setUserPassword(hash);
            //修改原来的user
            userService.updateAll(user);

            //先删除原来的关系
            Long userId = Long.parseLong(String.valueOf(user.getId()));
            //园所
            UserGarden userGarden = new UserGarden();
            userGarden.setUserId(userId);
            userGardenService.delRelation(userGarden);
            //角色
            UserRole userRole = new UserRole();
            userRole.setUserId(userId);
            userRoleService.deleteRelation(userRole);

            //添加新的关系
            //园所
            userGarden.setGardenId(user.getGarden_id());
            userGarden.setUserId(userId);
            userGarden.setGardenId(user.getGarden_id());
            userGardenService.addRelation(userGarden);
            //角色
            String roleIds = user.getRoleIds();
            //不是空进行添加
            if(roleIds!=null&&!roleIds.equals("")){
                String[] ids = roleIds.split(",");
                //批量添加角色
                userRole.setRoleIds(ids);
                //添加用户角色关系
                userRoleService.batchAddRelation(userRole);
            }
        }catch (Exception e){
            e.printStackTrace();
            return Result.failed("更新失败！");
        }
        return Result.success("更新成功！");

    }


    /**
     * 用户新增页面
     * @return 视图模型
     */
    @GetMapping("user/add")
    public ModelAndView add(){
        return new ModelAndView("sys/user/add");
    }

    @PostMapping("user/add")
    public Result update(User user,HttpSession session){
        System.out.println("要添加的用户"+user);
        User wUser = (User) session.getAttribute(Constants.USER_SESSION);
        //如果园所id为空 那就是指定园所的id 从会话用户获取
        //总部用户添加 机构有值 0 和 1
        if(user.getGarden_id()==null){
            user.setGarden_id(1l);
            System.out.println("进来饿了");
        }
        //如果真实园所为空 那就代表是 园所用户添加
        if(user.getRealGardenId()==null){
            user.setRealGardenId(wUser.getGarden_id());
        }

        //园所id 空 会话用户 不是总部用户 设定园所为 会话用户的gardenId
        if(user.getRealGardenId()==null){
            user.setRealGardenId(wUser.getGarden_id());
        }

        //验证用户编码
        Integer count =  userService.findByCode(user.getUser_code(),null);

        if(count>0){
            return Result.failed("用户编码已存在");
        }
        //先添加用户获取生成的 自增长id
        try {
            //对密码进行加密
            String hash = Utils.toMd5(user.getUserPassword(),Utils.get4Word());
            user.setUserPassword(hash)  ;
            userService.addUser(user);

        } catch (Exception e) {
            e.printStackTrace();
            return Result.failed("添加失败！");
        }
        //向用户园所关系表里添加关系
        UserGarden userGarden = new UserGarden();
        System.out.println("会话id"+wUser.getGarden_id());
        if(user.getGarden_id()>=1){
            //让指定园所 用户进入这里

            //指定园所 只能从会话用户 获取 园所id

            //这里 才会指定 是 具体哪个幼儿园

            //有园所 添加realGardenId
            userGarden = new UserGarden(Long.parseLong(String.valueOf(user.getId())),null,user.getRealGardenId());

        }else if(user.getGarden_id() == 0){
            //直接添加0 总部用户
            userGarden = new UserGarden(Long.parseLong(String.valueOf(user.getId())),null,0L);
        }
        System.out.println("添加用户的所属机构："+userGarden.getGardenId());
        userGardenService.addRelation(userGarden);

        String roleIds = user.getRoleIds();
        //向用户角色关系表添加关系
        UserRole userRole = new UserRole();
        userRole.setUserId(Long.parseLong(String.valueOf(user.getId())));
        //不是空进行添加
        if(roleIds!=null&&!roleIds.equals("")){
            String[] ids = roleIds.split(",");
            //批量添加角色
            userRole.setRoleIds(ids);
            //添加用户角色关系
            userRoleService.batchAddRelation(userRole);
        }

        return Result.success("添加成功！");
    }


    //基本资料页面
    @GetMapping("/user/settingPage")
    public ModelAndView settingPage(){
        return new ModelAndView("sys/user/user-setting");
    }
    //基本资料提交
    @PostMapping("/user/setting")
    public Result setting(User user,HttpSession session){
        try {
            userService.updateBasics(user);
            //重新查询保存到会话
            User sessionUser = (User) session.getAttribute(Constants.USER_SESSION);
            sessionUser = userService.findByUserCode(sessionUser.getUser_code());
            session.setAttribute(Constants.USER_SESSION,sessionUser);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.failed("修改失败！");
        }
        return Result.success("修改成功！");
    }

    //跳到系统首页面
    @GetMapping("/user/index")
    public ModelAndView index(){
        return new ModelAndView("sys/user/index");
    }
    //跳到用户管理页面
    @GetMapping("/users/userIndex")
    public ModelAndView userIndex(){
        return new ModelAndView("sys/user/userIndex");
    }

    /**
     * 获取用户管理页面的用户列表
     * @param vo 所属部门id 查询的字段名称 查询的值 分页的 信息
     * @return 用户列表
     */
    @GetMapping("/user/list")
    public Result userList(QueryUserVo vo,HttpSession session){
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        //如果是指定园所的用户
        if(user.getGarden_id()>0){
            //只查询指定园所用户
            vo.setGardenId(user.getGarden_id());
        }
        return Result.success(userService.findAllUser(vo));
    }

    @PostMapping("/user/batchDel")
    public Result batchDel(Long[] ids){
        try {
            UserGarden userGarden = new UserGarden();
            userGarden.setUserIds(ids);
            //删除用户操作
            //1.删除用户机构园所的关系
            userGardenService.batchDelRelation(userGarden);
            //2.批量删除用户角色的关系
            UserRole userRole = new UserRole(null,ids,null,null);
            //只需要通过用户id 删除相关用户的关系
            userRoleService.batchDelRelation(userRole);
            //3.删除用户包含部门、职位
            userService.batchDelUser(ids);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            return Result.success("批量删除失败！联系管理员");
        }
        return Result.success("批量删除成功！");
    }


    /**
     *根据用户id删除用户及相关关系
     * @param vo 删除的关系id对象
     * @return
     */
    @PostMapping("/user/delete")
    public Result userDel(DelUserVo vo){
        if(vo.getUserId() == 1){
            return Result.failed("防止误操作，禁止修改管理员");
        }
        try {
            //删除用户操作
            //1.删除用户机构园所的关系
            Long gardenId = vo.getGardenId()==null?0:vo.getGardenId();//为空为总部用户 0
            UserGarden userGarden = new UserGarden(vo.getUserId(),null,gardenId);
            userGardenService.delRelation(userGarden);
            //2.批量删除用户角色的关系
            if(vo.getRoleIds()!=null&&!vo.getRoleIds().equals("")){
                String[] roleIds = vo.getRoleIds().split(",");
            }
            UserRole userRole = new UserRole(vo.getUserId(),null,null,null);
            //只需要通过用户id 删除相关用户的关系
            userRoleService.deleteRelation(userRole);
            //3.删除用户包含部门、职位
            userService.delUser(Integer.parseInt(String.valueOf(vo.getUserId())));
        } catch (Exception e) {
            log.error(e.getMessage());
            return Result.failed("删除失败");
        }
        return Result.success("删除成功！");
    }

    @PostMapping("/user/upState")
    public Result userUpState(Long userId,Long state){
        if(userId == 1){
            return Result.failed("防止误操作，禁止修改");
        }
        String str = state==1?"启用":"禁用";
        try {
            userService.updateState(userId,state);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.success(str+"失败");
        }
        return Result.success(str+"成功！");
    }

    //这是首页
    @GetMapping("/user/welcome")
    public ModelAndView welcome(){
        return new ModelAndView("sys/user/welcome");
    }

    @Resource
    private MenuService menuService;
    @GetMapping("/user/menu")
    public Map<String,Object> menu(){
        User user = (User) SecurityUtils.getSubject().getPrincipal();
        return menuService.menu(user.getId());
    }

    //跳转到图标
    @GetMapping("/page/icon")
    public ModelAndView icon(){
        return new ModelAndView("redirect:/sys/page/icon");
    }

    @GetMapping("/user/login")
    public ModelAndView login(){
        return new ModelAndView("sys/user/login");
    }

    //查看本地cookie
    @GetMapping("/user/autoLogin")
    public Object autoLogin(HttpServletRequest request){
        Cookie[] cookies = request.getCookies();
        User user = null;
        for(Cookie cookie:cookies){
            if(cookie.getName().equals("user")){
                String userCode = cookie.getValue();
                user = userService.findByUserCode(userCode);
                cookie.setMaxAge(60*60*24*7);
            }
        }
        return Result.success(user,"查询成功！");
    }


    //用户登录界面
    @PostMapping ("/user/login")
    @Transactional
    public Result login(String userCode, String password,boolean rememberMe,
                        HttpSession session,HttpServletResponse response){
        //获取登录记住我后的主题信息
//        Subject currUser = SecurityUtils.getSubject();
        //如果没有验证凭证 生成token 进行验证授权 否则就是登录过直接方行
//        System.out.println("授权么"+currUser.isAuthenticated());
//        if(!currUser.isAuthenticated()) {
//
//        }
        UsernamePasswordToken token = new UsernamePasswordToken(userCode,password);
        //是否记住我
//        token.setRememberMe(rememberMe);
        try {
            SecurityUtils.getSubject().login(token);
        } catch (UnknownAccountException| IncorrectCredentialsException e) {
            return Result.failed("账号或密码错误");
        }catch (DisabledAccountException e){
            return Result.failed("账户禁用");
        }catch (ShiroException e){
            return Result.failed("验证码不正确！");
        }
        System.out.println("记住我"+rememberMe);
        //登录成功后保存到本地cookie
        if(rememberMe){
            Cookie cookie = new Cookie("user",userCode);
            //设置为七天 登录时重新设置为七天 这样就永久记住了
            cookie.setMaxAge(60*60*24*7);
            response.addCookie(cookie);
            log.info("保存到本地了");
        }else{
            //删除本地cookie
            response.addCookie(new Cookie("user",""));
        }
        User user = (User) SecurityUtils.getSubject().getPrincipal();
        //保存公司信息
        user.setBusiness(businessService.findById(1L));
        //保存园所id
        Long gardenId = userGardenService.findGardenIdByUId(Long.parseLong(String.valueOf(user.getId())));
        user.setGarden_id(gardenId);
        //保存角色名称
        //查询该用户的所有角色 切割成字符串赋值给roleName;
        List<Role> roleList = roleService.findByUid(Long.parseLong(String.valueOf(user.getId())));
        String roleName = "";
        if(roleList.get(0)!=null){
            List<String> roleNameList = roleList.stream().map(role->{
                return role==null?"":role.getRoleName();}).collect(Collectors.toList());
            if(roleNameList!=null){
                roleName = roleNameList.toString();
                roleName= roleName.substring(1,roleName.length()-1);
            }
        }
        user.setRoleName(roleName);
        //默认登录生成一次 费用记录 如果记录表没有 本月记录则 生成一次
        //获取本年本月一号日期 和 数据库作匹配
        String month = LocalDate.now().getYear()+"-"+LocalDate.now().getMonthValue()+"-01";
        LocalDate currentDate = LocalDate.parse(month);
        int count = chargeRecordService.countThisMonth(currentDate);
        //登录时限制 生成一次  暂时无用
        if(count==0){
            //未生成过本月 的记录 可以生成
        }


        //要插入收费明细表里的记录
        List<ChargeRecord> records = chargeRecordService.generateRecord();
        //插入记录表
        chargeRecordService.insertAllFee(records);
        //保存登录用户会话信息
        session.setAttribute(Constants.USER_SESSION, user);
        return Result.success("登录成功");
    }

    //退出登录
    @GetMapping("/user/logout")
    public ModelAndView logOut(){
        //重新返回登录界面
        return new ModelAndView("sys/user/login");
    }

    //访问验证码
    @GetMapping("/user/captcha")
    public void captcha(HttpServletRequest request, HttpServletResponse response){
        //设置响应类型 告诉浏览器输出的内容为图标
        response.setContentType("image/jpeg");

        //设置响应头信息，告诉浏览器不要缓存次内容
        response.setHeader("pragma","no-cache");
        response.setHeader("Cache-Control","no-cache");
        response.setDateHeader("Expire",0);

        Captcha captcha = new Captcha();
        captcha.getRandcode(request,response);
    }

    //获取真实验证码
    @PostMapping("/user/captcha")
    public Object captcha(HttpSession session){
        return Result.success(session.getAttribute(Captcha.RANDOMCODEKEY),"获取成功");
    }

    //修改密码页面
    @GetMapping("/user/modifyPage")
    public ModelAndView modifyPage(){
        return new ModelAndView("sys/user/user-password");
    }

    //修改密码
    @PostMapping("/user/modifyPwd")
    public Object modifyPwd(String old_password,String new_password,
                            String again_password,HttpSession session){
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        //旧密码的hash
        String oldHash = Utils.toMd5(old_password,user.getSalt());
        //如果旧密码输入正确 可以修改
        if(oldHash.equals(user.getUserPassword())){
            if(!new_password.equals(again_password)){
                return Result.failed("两次密码不一致");
            }
            //新密码的hash
            String hash = Utils.toMd5(new_password,user.getSalt());
            boolean res = userService.updateUser(user.getId(),hash);
            if(res){
                return Result.success("修改成功！");
            }else{
                return Result.failed("修改失败！");
            }
        }
        return Result.failed("原密码不正确");
    }



}
