package com.yingwu.project.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yingwu.project.model.entity.RoleSysInterface;
import com.yingwu.project.model.vo.SysInterfaceRoleVO;

import java.util.List;

/**
* @author Dy56
* @description 针对表【role_sys_interface】的数据库操作Mapper
*/
public interface RoleSysInterfaceMapper extends BaseMapper<RoleSysInterface> {

    /**
     * 获取接口和角色
     *
     * @return
     */
    List<SysInterfaceRoleVO> getSysInterfaceRole();

    /**
     * 批量删除角色系统接口
     *
     * @param deleteRoleSysInterfaceBatch
     * @return
     */
    boolean removeBatch(List<RoleSysInterface> deleteRoleSysInterfaceBatch);

    /**
     * 批量删除角色系统接口通过接口id
     *
     * @param deleteRoleIdBatch
     * @return
     */
    boolean  removeBatchByRoleId(List<Long> deleteRoleIdBatch);

    /**
     * 批量删除角色系统接口通过接口id
     *
     * @param deleteSysInterfaceIdBatch
     * @return
     */
    boolean removeBatchByInterfaceId(List<Long> deleteSysInterfaceIdBatch);
    
}




