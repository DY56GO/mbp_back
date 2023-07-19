package com.yingwu.project.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yingwu.project.common.ErrorCode;
import com.yingwu.project.exception.BusinessException;
import com.yingwu.project.mapper.DepartmentMapper;
import com.yingwu.project.mapper.UserDepartmentMapper;
import com.yingwu.project.model.entity.Department;
import com.yingwu.project.service.DepartmentService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
* @author Dy56
* @description 针对表【department】的数据库操作Service实现
*/
@Service
public class DepartmentServiceImpl extends ServiceImpl<DepartmentMapper, Department> implements DepartmentService {

    @Resource
    private UserDepartmentMapper userDepartmentMapper;

    /**
     * 部门信息校验
     *
     * @param department
     */
    @Override
    public void validDepartmentInfo(Department department) {
        if (department == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }

        String departmentName = department.getDepartmentName();

        if (StringUtils.isAnyBlank(departmentName)) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "参数为空");
        }
    }

    /**
     * 删除部门
     *
     * @param departmentId
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteDepartment(Long departmentId) {
        // 判断是否含有子部门
        Department department = new Department();
        department.setParentId(departmentId);
        QueryWrapper<Department> queryWrapper = new QueryWrapper<>(department);
        long count = count(queryWrapper);
        if (count != 0) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "存在子部门");
        }

        Object savePoint = TransactionAspectSupport.currentTransactionStatus().createSavepoint();
        try {
            // 删除
            removeById(departmentId);

            // 数据同步
            // 删除用户部门数据
            List<Long> deleteDepartmentIdBatch = new ArrayList<>();
            deleteDepartmentIdBatch.add(departmentId);
            userDepartmentMapper.removeBatchByDepartmentIdList(deleteDepartmentIdBatch);

        } catch (Exception e) {
            // 手动回滚异常
            TransactionAspectSupport.currentTransactionStatus().rollbackToSavepoint(savePoint);
            throw new BusinessException(ErrorCode.OPERATION_ERROR);
        }

        return true;
    }
}




