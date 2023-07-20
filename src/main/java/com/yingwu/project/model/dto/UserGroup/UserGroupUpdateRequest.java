package com.yingwu.project.model.dto.userGroup;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;

/**
 * 用户组更新请求
 *
 * @author Dy56
 */
@Data
public class UserGroupUpdateRequest implements Serializable {

    /**
     * id
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 用户组名称
     */
    private String groupName;

    /**
     * 描述
     */
    private String description;

    /**
     * 是否启用（0：否；1：是）
     */
    private Integer usingStart;

    /**
     * 用户组排序
     */
    private Double groupSort;

    private static final long serialVersionUID = 1L;

}