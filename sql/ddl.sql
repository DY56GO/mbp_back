-- 用户表
create table if not exists user
(
    id           bigint auto_increment comment 'id' primary key,
    user_name     varchar(256)                           null comment '用户名称',
    user_account  varchar(256)                           not null comment '用户账号',
    user_avatar   varchar(1024)                          null comment '用户头像',
    gender       tinyint                                null comment '性别',
    user_password varchar(512)                           not null comment '密码',
    gmt_create   datetime     default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime   datetime     default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    delete     tinyint      default 0                 not null comment '是否删除',
    constraint uni_userAccount
        unique (user_account)
) comment '用户';