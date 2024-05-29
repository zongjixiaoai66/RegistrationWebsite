package com.example.springboot.service.impl;

import com.example.springboot.entity.Subject;
import com.example.springboot.mapper.SubjectMapper;
import com.example.springboot.service.ISubjectService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 专业表 服务实现类
 * </p>
 *
 * @author
 *
 */
@Service
public class SubjectServiceImpl extends ServiceImpl<SubjectMapper, Subject> implements ISubjectService {

}
