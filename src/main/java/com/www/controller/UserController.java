package com.www.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.www.entity.*;
import com.www.form.DiaChiForm;
import com.www.form.FormRegister;
import com.www.form.ImformationForm;
import com.www.repository.NguoiDungRepository;
import com.www.repository.RoleRepository;
import com.www.repository.UserRepository;
import com.www.service.SanPhamService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Optional;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private NguoiDungRepository nguoiDungRepository;

    ObjectMapper objectMapper = new ObjectMapper();

    @GetMapping("/login")
    public String getLogin() {
        return "user/login";
    }

    @GetMapping("/register")
    public String getRegister() {
        return "user/register";
    }

    @PostMapping(value = "/register", consumes = "application/x-www-form-urlencoded")
    public RedirectView postRegister(FormRegister formRegister, Model model, BindingResult bindingResult, HttpServletRequest request) {
        if (bindingResult.hasErrors()) {
            System.out.println("Co loi xay ra " + bindingResult);

            return new RedirectView(request.getContextPath() + "/user/login");
        } else {
            if (userRepository.findByEmail(formRegister.getEmail()) == null) {
                Role role = roleRepository.findByName("ROLE_MEMBER");

                User user = new User();
                Set<Role> roles = new HashSet<>();
                roles.add(role);
                user.setRoles(roles);
                user.setEmail(formRegister.getEmail());
                user.setPassword(passwordEncoder.encode(formRegister.getMatKhau()));
                userRepository.save(user);

                NguoiDung nguoiDung = new NguoiDung();
                nguoiDung.setUser(user);
                nguoiDung.setHoTenDem(formRegister.getHoTenDem());
                nguoiDung.setTen(formRegister.getTen());
                nguoiDung.setSoDienThoai(formRegister.getSoDienThoai());
                nguoiDungRepository.save(nguoiDung);

                return new RedirectView(request.getContextPath() + "/user/login?success");
            }

            return new RedirectView(request.getContextPath() + "/user/register?failure");
        }

    }

    @RequestMapping(value = {"/information", "/", ""})
    public String getInformation() {
        return "user/information";
    }

    @PostMapping(value = {"/", "/imformation", ""}, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String postInformation(@RequestParam(required = false, value = "anhDaiDien") MultipartFile anhDaiDien, @RequestParam(required = true, value = "dataJson") String jsonData) throws IOException {

        ImformationForm imformationForm = objectMapper.readValue(jsonData, ImformationForm.class);
        NguoiDung nguoiDung = nguoiDungRepository.findById(imformationForm.getId());
        if (!anhDaiDien.isEmpty()) {
            nguoiDung.setAvatar(anhDaiDien.getBytes());
        }

        nguoiDung.setHoTenDem(imformationForm.getHoTenDem());
        nguoiDung.setTen(imformationForm.getTen());
        nguoiDung.setSoDienThoai(imformationForm.getSoDienThoai());

        SimpleDateFormat dateformat3 = new SimpleDateFormat("MM/dd/yyyy");
        try {
            Date sinhNhat = dateformat3.parse(imformationForm.getNgaySinh());
            nguoiDung.setNgaySinh(sinhNhat);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        nguoiDung.setGioiTinh(imformationForm.isGioiTinh());
        nguoiDung.setId(imformationForm.getId());

        nguoiDungRepository.save(nguoiDung);
        return "user/information";
    }


    @RequestMapping("/address")
    public String getAddress() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User user = userRepository.findByEmail(authentication.getName());
        NguoiDung nguoiDung = nguoiDungRepository.findByUser(user);
        System.out.println("diachinguoidung"+nguoiDung.getDiaChis());
        return "user/address-page";
    }

    @PostMapping(value = "/add-address", consumes = "application/x-www-form-urlencoded")
    public RedirectView postAddress(DiaChiForm diaChiForm, Model model) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User user = userRepository.findByEmail(authentication.getName());
        NguoiDung nguoiDung = nguoiDungRepository.findByUser(user);

        DiaChi diaChi = new DiaChi();
        diaChi.setTenNguoiNhan(diaChiForm.getTenNguoiNhan());
        diaChi.setTinhThanhPho(diaChiForm.getTinhThanhPho());
        diaChi.setQuanHuyen(diaChiForm.getQuanHuyen());
        diaChi.setPhuongXa(diaChiForm.getPhuongXa());
        diaChi.setChiTiet(diaChiForm.getChiTiet());
        diaChi.setSoDienThoai(diaChiForm.getSoDienThoai());
        if (diaChiForm.getLabel() == 1) {
            diaChi.setLableAddress(LableAddress.HOME);
        }else {
            diaChi.setLableAddress(LableAddress.WORK);
        }

        nguoiDung.getDiaChis().add(diaChi);

        nguoiDungRepository.save(nguoiDung);
        return new RedirectView("address");
    }

}
