drop table if exists edu_advertisement;

drop table if exists edu_goods;

drop table if exists edu_post;

drop table if exists edu_resource;

drop table if exists edu_school;

drop table if exists edu_wish;

/*==============================================================*/
/* Table: edu_advertisement                                     */
/*==============================================================*/
create table edu_advertisement
(
    ad_id                bigint not null auto_increment,
    ad_info              varchar(200),
    ad_img               varchar(200),
    useFlag              char(1) comment '0为使用，1为隐藏',
    create_by            varchar(200),
    create_time          datetime,
    update_by            varchar(200),
    update_time          datetime,
    primary key (ad_id)
);

/*==============================================================*/
/* Table: edu_goods                                             */
/*==============================================================*/
create table edu_goods
(
    goods_id             bigint not null auto_increment,
    school_id            bigint,
    goods_img            varchar(200),
    goods_info           varchar(200),
    goods_price          decimal(50,10),
    buyer_name           varchar(200),
    soldFlag             char(1) comment '0为待售，1为售出',
    create_by            varchar(200),
    create_time          datetime,
    update_by            varchar(200),
    update_time          datetime,
    primary key (goods_id)
);

/*==============================================================*/
/* Table: edu_post                                              */
/*==============================================================*/
create table edu_post
(
    post_id              bigint not null auto_increment,
    school_id            bigint,
    post_info            varchar(200),
    comFlag              char(1) comment '0为正常，1为完成',
    create_by            varchar(200),
    create_time          datetime,
    update_by            varchar(200),
    update_time          datetime,
    primary key (post_id)
);

/*==============================================================*/
/* Table: edu_resource                                          */
/*==============================================================*/
create table edu_resource
(
    resource_id          bigint not null auto_increment,
    resource_name        varchar(200),
    resource_img         varchar(200),
    resource_info        varchar(200),
    resource_url         varchar(200),
    resource_type        varchar(200),
    resource_grade       varchar(200),
    resource_object      varchar(200),
    resource_ver         varchar(200),
    norFlag              char(1) comment '0为正常，1为失效',
    create_by            varchar(200),
    create_time          datetime,
    update_by            varchar(200),
    update_time          datetime,
    primary key (resource_id)
);

/*==============================================================*/
/* Table: edu_school                                            */
/*==============================================================*/
create table edu_school
(
    school_id            bigint not null auto_increment,
    school_name          varchar(200),
    school_img           varchar(200),
    school_info          varchar(200),
    school_cif           varchar(200),
    school_addr          varchar(200),
    school_pc            varchar(20),
    delFlag              char(1) comment '0为正常，1为停用',
    create_by            varchar(200),
    create_time          datetime,
    update_by            varchar(200),
    update_time          datetime,
    primary key (school_id)
);

/*==============================================================*/
/* Table: edu_wish                                              */
/*==============================================================*/
create table edu_wish
(
    wish_id              bigint not null auto_increment,
    wish_name            varchar(200),
    wish_info            varchar(200),
    wish_img             varchar(200),
    wisher_school        bigint,
    wisher_name          varchar(200),
    claimant_name        varchar(200),
    claimFlag            char(1) comment '0为未认领，1为已认领',
    create_by            varchar(200),
    create_time          datetime,
    update_by            varchar(200),
    update_time          datetime,
    primary key (wish_id)
);
