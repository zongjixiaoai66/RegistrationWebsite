package com.example.springboot.service;

import com.example.springboot.controller.dto.UserDTO;
import com.example.springboot.controller.dto.UserPasswordDTO;
import com.example.springboot.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author
 * @since 2022-01-26
 */
public interface IUserService extends IService<User> {

    UserDTO login(UserDTO userDTO);

    User register(UserDTO userDTO);

    void updatePassword(UserPasswordDTO userPasswordDTO);

    void updateDormIdNull(Integer id);
}
