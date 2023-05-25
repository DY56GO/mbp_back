package com.yingwu.project.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yingwu.project.model.entity.Menu;

/**
 * 菜单服务
 *
 * @author Dy56
 */
public interface MenuService extends IService<Menu> {

    /**
     * 菜单信息校验
     *
     * @param menu
     */
    void validMenuInfo(Menu menu);

}
