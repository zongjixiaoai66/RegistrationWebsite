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
@ApiModel(value = "Dormrepair对象", description = "")
public class Dormrepair implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("用户id")
    @Alias("用户id")
    private Integer userid;

    @ApiModelProperty("宿舍id")
    @Alias("宿舍id")
    private Integer dormid;

    @ApiModelProperty("用户名称")
    @Alias("用户名称")
    private String username;

    @ApiModelProperty("问题")
    @Alias("问题")
    private String content;

    @ApiModelProperty("报修状态")
    @Alias("报修状态")
    private String repairstatus;



    @ApiModelProperty("报修宿舍地址")
    @Alias("报修宿舍地址")
    private String address;


}
