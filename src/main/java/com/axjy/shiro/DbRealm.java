package com.axjy.shiro;

import com.axjy.pojo.sys.User;
import com.axjy.service.sys.PermissionService;
import com.axjy.service.sys.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Set;

/**
 * Created by Joe on 2021/09/26 上午 9:07
 */
@Component("realm")
public class DbRealm extends AuthorizingRealm {
    @Resource
    private UserService userService;
    @Resource
    private PermissionService permissionService;
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        User user = (User) principalCollection.getPrimaryPrincipal();
        Set<String> permCodes = permissionService.findAllPermCodes(user.getId());
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        authorizationInfo.setStringPermissions(permCodes);
        return authorizationInfo;
    }


    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        String userCode = (String) authenticationToken.getPrincipal();
        User user = userService.findByUserCode(userCode);
        if(user==null){
            return null;
        }
        if(user.getState()==2){
            //账户禁用异常
            throw new DisabledAccountException();
        }

        return new SimpleAuthenticationInfo(user,user.getUserPassword(), ByteSource.Util.bytes(user.getSalt()),this.getName());
    }
}
