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
@ApiModel(value = "Arriveschool对象", description = "")
public class Arriveschool implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("学生id")
    @Alias("学生id")
    private Integer userid;

    @ApiModelProperty("学生名称")
    @Alias("学生名称")
    private String username;

    @ApiModelProperty("学院名称")
    @Alias("学院名称")
    private String collegename;

    @ApiModelProperty("班级")
    @Alias("班级")
    private Integer classid;

    @ApiModelProperty("学号")
    @Alias("学号")
    private String number;

    @ApiModelProperty("审核状态")
    @Alias("审核状态")
    private String status;


}
