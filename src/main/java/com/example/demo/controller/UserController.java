package com.example.demo.controller;

import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

  private final UserService userService;

  @Autowired
  UserController(UserService userService) {
    this.userService = userService;
  }

  @GetMapping("/")
  public String home(Model model) {
    String url = "index";

    // 루트 경로로 접속 시, 사용자 정보를 조회하여 모델에 추가
    model.addAttribute("userInfo", userService.selectAllUsers());

    return url;
  }
}
