package com.example.demo.controller;

import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.DeleteMapping;
import com.example.demo.model.UserVO;

import java.util.Comparator;
import java.util.List;

@Controller
public class UserController {

    //DI 객체 주입
    private final UserService userService;

    @Autowired
    UserController(UserService userService){
        this.userService = userService;
    }

    @GetMapping("/")
    public String home(Model model) {
        String url = "index";

        List<UserVO> result =    userService.SelectAllUsers();

        System.out.println("home controller start");
        model.addAttribute("userInfo", result);
        return url;
    }


    @GetMapping("/userSignUp")
    public String showSignUpPage() {
        // 회원 가입 페이지 보여주는 로직
        return "signup";
    }

    @PostMapping("/userSignUp")
    public String processSignUp(@ModelAttribute("user") UserVO userVO) {
        // 회원 가입 처리 로직
        return "welcome";
    }

    @PutMapping("/users/{id}")
    public String updateUser(@PathVariable("id") Long id, @ModelAttribute("user") UserVO userVO) {
        // 사용자 정보 업데이트 처리 로직
        return "success";
    }

    @DeleteMapping("/users/{id}")
    public String deleteUser(@PathVariable("id") Long id) {
        // 사용자 삭제 처리 로직
        return "deleted";
    }


}
