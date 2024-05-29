package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import cn.hutool.core.annotation.Alias;

/**
 * <p>
 *
 * </p>
 *
 * @author
 *
 */
@Getter
@Setter
@ApiModel(value = "Schoolintroduce对象", description = "")
public class Schoolintroduce implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("入学须知")
    @Alias("入学须知")
    private String startschool;

    @ApiModelProperty("学校简介")
    @Alias("学校简介")
    private String introduce;

    @ApiModelProperty("校园风光")
    @Alias("校园风光")
    private String schoolsite;

    @ApiModelProperty("校园咨询")
    @Alias("校园咨询")
    private String schoolzixun;

    @ApiModelProperty("校园地图")
    @Alias("校园地图")
    private String map;

    @ApiModelProperty("缴费链接")
    @Alias("缴费链接")
    private String fee;


}
