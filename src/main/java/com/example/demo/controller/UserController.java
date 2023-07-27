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

    @PostMapping("/sendNumberToServer")
    @ResponseBody
    public Map<String, Object> receiveNumber(@RequestParam("number") int number) {
        System.out.println("JSP에서 받은 숫자: " + number);

        // 여기에서 숫자를 가공하거나 다른 처리를 수행한 후, 결과를 Map으로 저장합니다.
        Map<String, Object> result = new HashMap<>();
        result.put("name", "John Doe"); // 임의의 결과 값

        return result;
    }
}
