package com.example.demo.controller;

import com.example.demo.model.UserVO;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
public class UserRestController {
  private final UserService userService;

  @Autowired
  UserRestController(UserService userService) {
    this.userService = userService;
  }


  @RequestMapping("")
  public ResponseEntity<List<UserVO>> orderlist(@RequestBody Map<String, String> vo) throws Exception {
    ResponseEntity<List<UserVO>> entity = null;

    List<UserVO> list = userService.SelectAllUsers();

    entity = new ResponseEntity<List<UserVO>>(list, HttpStatus.OK);

    return entity;
  }

}
