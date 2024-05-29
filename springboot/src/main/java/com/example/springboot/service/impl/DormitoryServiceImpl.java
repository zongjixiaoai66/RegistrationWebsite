package com.example.springboot.service.impl;

import com.example.springboot.entity.Dormitory;
import com.example.springboot.mapper.DormitoryMapper;
import com.example.springboot.service.IDormitoryService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 
 * @since 2023-03-16
 */
@Service
public class DormitoryServiceImpl extends ServiceImpl<DormitoryMapper, Dormitory> implements IDormitoryService {

}
