package com.example.demo.controller;

import com.example.demo.model.UserVO;
import com.example.demo.service.UserService;
import com.sun.tools.jconsole.JConsoleContext;
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

  @PostMapping("/updateusers")
  public ResponseEntity<String> updateUsers(@RequestBody List<UserVO> userVOList) {
    try {
      System.out.println(userVOList);
      userService.updateUsers(userVOList); // 서비스 계층의 메서드 호출하여 사용자 정보 수정
      return new ResponseEntity<>("수정이 정상적으로 완료되었습니다.", HttpStatus.OK);
    } catch (Exception e) {
      return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
          .body("Error: " + e.getMessage()); // 에러 메시지를 응답으로 전달
    }
  }

  @PostMapping("/deleteusers")
  public ResponseEntity<String> deleteUsers(@RequestBody List<String> userNos) {
    try {
      System.out.println(userNos);
      userService.deleteUsers(userNos);
      return new ResponseEntity<>("삭제가 정상적으로 완료되었습니다.", HttpStatus.OK);
    } catch (Exception e) {
      return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
          .body("Error: " + e.getMessage()); // 에러 메시지를 응답으로 전달
    }
  }

}
