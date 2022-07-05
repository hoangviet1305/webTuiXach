package com.www.controller;

import com.www.entity.*;
import com.www.repository.HoaDonRepository;
import com.www.repository.NguoiDungRepository;
import com.www.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Calendar;
import java.util.Date;
import java.util.Set;

@Controller
@RequestMapping("/order")
public class HoaDonControler {
    @Autowired
    private NguoiDungRepository nguoiDungRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private HoaDonRepository hoaDonRepository;

    @GetMapping("/add")
    public String getAddHoaDon(HttpSession session) {
        try {
            Cart cart = (Cart) session.getAttribute("cart");
            Set<ChiTietHoaDon> chiTietHoaDons = cart.getChiTietHoaDons();

            HoaDon hoaDon = new HoaDon();
            hoaDon.setDate(new Date());

            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            User user = userRepository.findByEmail(authentication.getName());
            NguoiDung nguoiDung = nguoiDungRepository.findByUser(user);
            hoaDon.setThoiGianLap(Calendar.getInstance());
            hoaDon.setNguoiDung(nguoiDung);
            hoaDon.setTrangThai(TrangThai.CHUA_XAC_NHAN);
            hoaDon.setChiTietHoaDons(chiTietHoaDons);
            hoaDonRepository.save(hoaDon);
            return "redirect:/cart/payment?success=true";
        }catch (Exception e) {
            e.printStackTrace();
            return "redirect:/cart/payment?failure=true";
        }

    }
}
