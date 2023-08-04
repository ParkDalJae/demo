package com.example.demo.controller;

import com.example.demo.model.UserVO;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
public class UserRestController {

  private final UserService userService;

  @Autowired
  UserRestController(UserService userService) {
    this.userService = userService;
  }



  @PostMapping("/users")
  public ResponseEntity<String> addUser(@RequestBody List<UserVO> userVOList) {
    try {
      userService.signUpUsersBatch(userVOList);
      return new ResponseEntity<>("User added successfully", HttpStatus.CREATED);
    } catch (DuplicateKeyException e) {
      return ResponseEntity.status(HttpStatus.BAD_REQUEST)
          .body("Error: 중복된 아이디가 존재합니다."); // 중복된 id 에러 메시지를 응답으로 전달
    } catch (Exception e) {
      return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
          .body("Error: " + e.getMessage()); // 다른 에러 메시지를 응답으로 전달
    }
  }

  @PostMapping("/selectusers")
  public ResponseEntity<List<UserVO>> selectUsers(@RequestBody List<Long> noList) {
    try {
      List<UserVO> selectedUsers = userService.getUsersByNos(noList);
      return new ResponseEntity<>(selectedUsers, HttpStatus.OK);
    } catch (Exception e) {
      return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
          .body(null); // 에러 발생 시 빈 응답 또는 에러 메시지 전달
    }
  }

  // 나머지 PUT, DELETE 메소드 등도 필요한 경우 작성
}
