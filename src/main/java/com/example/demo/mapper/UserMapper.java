package com.example.demo.mapper;

import com.example.demo.model.UserVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {

    List<UserVO> selectAllUsers();

    UserVO selectUserName(UserVO vo);

    List<UserVO> selectUserChecked(List<Long> nos);

    void insertUser(UserVO vo);

    void insertUsersBatch(List<UserVO> users);

    void updateUsers(List<UserVO> users);
}
