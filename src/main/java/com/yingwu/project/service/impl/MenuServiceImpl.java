package com.yingwu.project.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yingwu.project.common.ErrorCode;
import com.yingwu.project.exception.BusinessException;
import com.yingwu.project.mapper.MenuMapper;
import com.yingwu.project.model.entity.Menu;
import com.yingwu.project.service.MenuService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

/**
* @author Dy56
* @description 针对表【menu】的数据库操作Service实现
*/
@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements MenuService {

    /**
     * 菜单信息校验
     *
     * @param menu
     */
    
    public void validMenuInfo(Menu menu) {
        if (menu == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }

        String menuTitle = menu.getMenuTitle();
        String routePath = menu.getRoutePath();

        if (StringUtils.isAnyBlank(menuTitle, routePath)) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "参数为空");
        }
    }

}




