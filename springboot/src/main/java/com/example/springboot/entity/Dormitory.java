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
 * @since 2023-03-16
 */
@Getter
@Setter
@ApiModel(value = "Dormitory对象", description = "")
public class Dormitory implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("宿舍地点")
    @Alias("宿舍地点")
    private String address;

    @ApiModelProperty("住宿人数限制")
    @Alias("住宿人数限制")
    private Integer total;

    @ApiModelProperty("已住宿人数")
    @Alias("已住宿人数")
    private Integer existtotal;


}
