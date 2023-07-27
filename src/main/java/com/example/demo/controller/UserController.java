package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.example.demo.model.User;

import java.util.HashMap;
import java.util.Map;

@Controller
public class UserController {

    @GetMapping("/")
    public String home(Model model) {
        System.out.println("home controller start");
        model.addAttribute("name", "유저컨트롤러에서 만든 ");
        return "index";
    }

    @GetMapping("/userSignUp")
    public String showSignUpPage() {
        // 회원 가입 페이지 보여주는 로직
        return "signup";
    }

    @PostMapping("/userSignUp")
    public String processSignUp(@ModelAttribute("user") User user) {
        // 회원 가입 처리 로직
        return "welcome";
    }

    @PutMapping("/users/{id}")
    public String updateUser(@PathVariable("id") Long id, @ModelAttribute("user") User user) {
        // 사용자 정보 업데이트 처리 로직
        return "success";
    }

    @DeleteMapping("/users/{id}")
    public String deleteUser(@PathVariable("id") Long id) {
        // 사용자 삭제 처리 로직
        return "deleted";
    }


}
