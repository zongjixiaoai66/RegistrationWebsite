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
 * 专业表
 * </p>
 *
 * @author
 *
 */
@Getter
@Setter
@ApiModel(value = "Subject对象", description = "专业表")
public class Subject implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("二级学院名称")
    @Alias("二级学院名称")
    private String secondcollege;

    @ApiModelProperty("专业名称")
    @Alias("专业名称")
    private String subjectname;

    @ApiModelProperty("培养目标")
    @Alias("培养目标")
    private String goal;

    @ApiModelProperty("授予学位")
    @Alias("授予学位")
    private String grantacademic;

    @ApiModelProperty("课程设置")
    @Alias("课程设置")
    private String coursesetting;


}
