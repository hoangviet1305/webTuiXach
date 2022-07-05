package com.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/user/order")
public class UserOrderController {
    @RequestMapping(value = {"/", "/all", ""})
    public String getOrderAll(@RequestParam(value = "state", required = false) String stateOfOrder) {
        return "/user/order-all";
    }

}
