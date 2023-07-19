package com.yingwu.project.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yingwu.project.model.entity.Department;

/**
* @author Dy56
* @description 针对表【department】的数据库操作Service
*/
public interface DepartmentService extends IService<Department> {

    /**
     * 部门信息校验
     *
     * @param department
     */
    void validDepartmentInfo(Department department);

    /**
     * 删除部门
     *
     * @param departmentId
     * @return
     */
    boolean deleteDepartment(Long departmentId);

}
