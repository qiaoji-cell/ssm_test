package com.axjy.mapper.sys;

import com.axjy.pojo.sys.Role;
import com.axjy.vo.sys.QuickQueryVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleMapper {

    List<Role> findByUid(Long userId);

    List<Role> findAllList(Long gardenId);

    List<Role> findAllRole(@Param("vo")QuickQueryVo vo);

    Integer findByName(@Param("name")String name,@Param("gardenId")Long gardenId,@Param("roleId")Long roleId);

    void batchDel(Long[] ids);

    int deleteByPrimaryKey(Long id);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
}