package com.example.demo.service;

import com.example.demo.mapper.UserMapper;
import com.example.demo.model.UserVO;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

  private final UserMapper userMapper;

  @Autowired
  UserService(UserMapper userMapper){
    this.userMapper = userMapper;
  }

  public List<UserVO> selectAllUsers(){
    return userMapper.selectAllUsers();
  }

  public List<UserVO> searchUsers(String searchType, String searchKeyword) {
    return userMapper.searchUsers(searchType, searchKeyword);
  }

  public List<UserVO> getUsersByNos(List<Long> nos) {
    return userMapper.selectUserChecked(nos);
  }

  public void signUpUser(UserVO userVO){
    userMapper.insertUser(userVO);
  }

  public void signUpUsersBatch(List<UserVO> users) {
    userMapper.insertUsersBatch(users);
  }

  public void updateUsers(List<UserVO> userVO){ userMapper.updateUsers(userVO);}

  public void deleteUsers(List<String> nos){userMapper.deleteUsers(nos);}
}
