package com.example.springboot.service.impl;

import com.example.springboot.entity.Classes;
import com.example.springboot.mapper.ClassesMapper;
import com.example.springboot.service.IClassesService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author
 *
 */
@Service
public class ClassesServiceImpl extends ServiceImpl<ClassesMapper, Classes> implements IClassesService {

}
