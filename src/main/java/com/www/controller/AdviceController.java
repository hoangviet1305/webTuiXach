package com.www.controller;

import com.www.entity.NguoiDung;
import com.www.entity.User;
import com.www.repository.NguoiDungRepository;
import com.www.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class AdviceController {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private NguoiDungRepository nguoiDungRepository;

    @ModelAttribute("nguoiDung")
    public NguoiDung getNguoiDungLogin() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        User user = userRepository.findByEmail(authentication.getName());

        NguoiDung nguoiDung = nguoiDungRepository.findByUser(user);

        return nguoiDung;
    }

}
