package com.axjy.controller.sys;

import com.axjy.exception.DepException;
import com.axjy.pojo.sys.DepGarden;
import com.axjy.pojo.sys.Dep;
import com.axjy.service.sys.DepService;
import com.axjy.service.sys.DepGardenService;
import com.axjy.service.sys.UserService;
import com.axjy.utils.Result;
import com.axjy.vo.base.DepTreeVo;
import com.axjy.vo.base.SelectTreeVo;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Joe on 2021/10/18 上午 9:24
 */
@RestController
@RequestMapping("/sys")
@Transactional
public class DepController {
    @Resource
    private DepService depService;
    @Resource
    private DepGardenService depGardenService;
    @Resource
    private UserService userService;

    private List<DepTreeVo> trees = null;
    @GetMapping("/dep/list")
    public Result depList(Long gardenId){
        if(gardenId>0){
            gardenId=1L;
        }
        System.out.println("部门所属机构:"+gardenId);
        List<DepTreeVo> voList = depService.findAllDep(gardenId);
        trees = voList;
        return Result.success(voList,"查询成功");
    }

    //更新   前验证 该编码 名称 是否存在
    @PostMapping("/dep/update")
    public Result depUpdate(Dep dep, Long gardenId){
        try{
            Object code = getCode(dep.getDepCode(),dep.getId(),gardenId);
            if(code!=null){
                return Result.failed("部门编码已存在，请重新输入");
            }
            Object name = getName(dep.getDepName(),dep.getId(),gardenId);
            if(name!=null){
                return Result.failed("部门名称已存在，请重新输入");
            }
            depService.updateDep(dep);
        }catch (Exception e){
            System.out.println(e);

            return Result.failed("更新失败:"+e.getMessage());
        }
        return Result.success("更新成功");
    }
    //根据名称查找
    public Object getName(String name,Long depId,Long gardenId){
        return depService.findByName(name,depId,gardenId);
    }

    //根据code查找
    public Object getCode(String code,Long depId,Long gardenId){
        return depService.findByCode(code,depId,gardenId);
    }

    //添加前验证 该编码 名称 是否存在
    @PostMapping("/dep/add")
    public Result depAdd(Dep dep, Long gardenId){
        try{
            Object code =  getCode(dep.getDepCode(),null,gardenId);
            if(code!=null){
                return Result.failed("部门编码已存在，请重新输入");
            }
            Object name = getName(dep.getDepName(),null,gardenId);
            if(name!=null){
                return Result.failed("部门名称已存在，请重新输入");
            }
            depService.addDep(dep,gardenId);

            //关系对象
            DepGarden relation = new DepGarden();
            relation.setDepId(dep.getId());
            relation.setGardenId(gardenId);

            //插入部门园所关系
            depGardenService.addRelation(relation);

        }catch (Exception e){
            return Result.failed("添加失败:"+e.getMessage());
        }
        return Result.success("添加成功");
    }


    /*删除前 验证有无 员工 */
    @PostMapping("/dep/del")
    public Result depDel(Long id,Long gardenId) throws RuntimeException{
        //删除前验证有没有子部门
        Integer countChildDep = depService.findByParentId(id);
        if(countChildDep>0){
//                return Result.failed("删除失败！该部门下还有子部门");
            throw new DepException("删除失败！该部门下还有子部门",3001);
        }
        //删除前验证有无员工
        Integer countUser = userService.countDepUser(id);
        if(countUser>0){
//                return Result.failed("删除失败！该部门下已有人员");
            throw new DepException("删除失败！该部门下已有人员",3002);
        }
        //删除关系 通过部门id 和 园所id来删除
        DepGarden relation = new DepGarden();
        relation.setGardenId(gardenId);
        relation.setDepId(id);
        System.out.println(relation);
        depGardenService.delRelation(relation);
        //删除部门

        //如果删除异常 单独捕获
        try {
            depService.delDep(id);
        } catch (Exception e) {
            throw new DepException("没删除成功！联系管理员",3009);
        }

        return Result.success("删除成功");
    }

    @ExceptionHandler(value={DepException.class})
    public Result exceptionHandler(DepException exception){
        return Result.failed(exception.getMessage(),exception.getCode());
    }



    public List<SelectTreeVo> findChildSelect(int count,String cascading,List<SelectTreeVo> selectTree,List<DepTreeVo> parentTree){
        //增加级别符号
        for(int i=0;i<count;i++){
            cascading=cascading+cascading;
        }
        count++;
        for(DepTreeVo treeVo:parentTree){
            SelectTreeVo childSelect = new SelectTreeVo();
            childSelect.setId(treeVo.getId());
            childSelect.setSelectName(cascading+treeVo.getDepName());
            selectTree.add(childSelect);
            if(treeVo.getChildren()!=null){
                findChildSelect(count,cascading,selectTree,treeVo.getChildren());
            }
        }

        return selectTree;
    }

    public List<SelectTreeVo> getSelectTree(List<DepTreeVo> list){

        //代表几级
        int count = 0;
        //级别符号
        String cascading = "|——";

        List<SelectTreeVo> selectTree = new ArrayList<>();
        for(DepTreeVo vo:list){
            if(vo.getId()==1){
                count = 0;
                cascading="|——";
            }
            SelectTreeVo selectTreeVo = new SelectTreeVo();
            selectTreeVo.setSelectName(vo.getDepName());
            selectTreeVo.setId(vo.getId());
            selectTree.add(selectTreeVo);
            if(vo.getChildren()!=null){
                findChildSelect(count,cascading,selectTree,vo.getChildren());
            }

        }
        return selectTree;
    }

    //获取总部分园下拉树形列表
    @GetMapping("/dep/selectTree")
    public Result selectTree(Long gardenId){
        List<DepTreeVo> voList = depService.findAllDep(gardenId);
        return Result.success(getSelectTree(voList),"查询成功！");
    }



}
