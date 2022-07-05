package com.www.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.www.entity.*;
import com.www.form.AddToCartForm;
import com.www.repository.NguoiDungRepository;
import com.www.repository.SanPhamRepository;
import com.www.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;

@Controller
@RequestMapping("/cart")
public class CartController {
    ObjectMapper objectMapper = new ObjectMapper();
    @Autowired
    private SanPhamRepository sanPhamRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private NguoiDungRepository nguoiDungRepository;

    @RequestMapping(value = {"", "/"})
    public String getCart() {
        return "cart";
    }

    @GetMapping(value = {"/add"})
    public String postAddCart(@RequestParam(value = "maSanPham") int maSanPham, @RequestParam(value = "soLuong") int soLuong, HttpSession session) {

        SanPham sanPham = sanPhamRepository.findById(maSanPham);

        if (session.getAttribute("cart") == null) {
            session.setAttribute("cart", new Cart());

            Cart cart = (Cart) session.getAttribute("cart");

            Set<ChiTietHoaDon> chiTietHoaDons = new HashSet<>();
            ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon();
            chiTietHoaDon.setSoLuong(soLuong);
            chiTietHoaDon.setSanPham(sanPham);

            chiTietHoaDons.add(chiTietHoaDon);

            cart.setChiTietHoaDons(chiTietHoaDons);
            session.setAttribute("cart", cart);
        } else {
            Cart cart = (Cart) session.getAttribute("cart");
            int flag = 0;
            for (ChiTietHoaDon chiTietHoaDon : cart.getChiTietHoaDons()) {
                if (chiTietHoaDon.getSanPham().getId() == maSanPham) {
                    int soLuongHienTai = chiTietHoaDon.getSoLuong();
                    cart.getChiTietHoaDons().remove(chiTietHoaDon);
                    ChiTietHoaDon chiTietHoaDon1 = new ChiTietHoaDon();
                    chiTietHoaDon1.setSanPham(chiTietHoaDon.getSanPham());
                    chiTietHoaDon1.setSoLuong(soLuongHienTai + soLuong);
                    cart.getChiTietHoaDons().add(chiTietHoaDon1);
                    session.setAttribute("cart", cart);
                    break;
                }
                flag++;
            }

            if (flag >= cart.getChiTietHoaDons().size()) {
                ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon();
                chiTietHoaDon.setSoLuong(soLuong);
                chiTietHoaDon.setSanPham(sanPham);
                cart.getChiTietHoaDons().add(chiTietHoaDon);
                session.setAttribute("cart", cart);
            }
        }


        return "redirect:/";
    }

    @GetMapping("/payment")
    private String getPayment(HttpSession session, Model model) {
        if (session.getAttribute("cart") == null){
            return "redirect:/cart?failure=true";
        }

        NguoiDung nguoiDung = (NguoiDung) model.getAttribute("nguoiDung");

        if (nguoiDung.getDiaChis() == null || nguoiDung.getDiaChis().size() <= 0) {
            return "redirect:/user/address?failure=true";
        }

        return "payment";
    }

}
