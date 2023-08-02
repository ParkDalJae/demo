package com.example.demo.service;


import com.example.demo.mapper.UserMapper;
import com.example.demo.model.UserVO;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
  private final UserMapper  userMapper;

  @Autowired
  UserService(UserMapper userMapper){
      this.userMapper = userMapper;
  }

  public List<UserVO> SelectAllUsers(){

      return userMapper.selectAllUsers() ;
  }
  public void signUpUsersBatch(List<UserVO> users) {
    userMapper.insertUsersBatch(users);
  }

}
