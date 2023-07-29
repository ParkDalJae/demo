package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
public class NumberController {

    @PostMapping("/sendNumberToServer")
    @ResponseBody
    public Map<String, Object> receiveNumber(@RequestParam("number") int number) {
        System.out.println("JSP에서 받은 숫자: " + number);

        // 여기에서 숫자를 가공하거나 다른 처리를 수행한 후, 결과를 Map으로 저장합니다.
        Map<String, Object> result = new HashMap<>();
        result.put("name", number); // 임의의 결과 값

        return result;
    }
}
