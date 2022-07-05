package com.www.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.www.entity.MauSac;
import com.www.entity.SanPham;
import com.www.entity.TheLoai;
import com.www.form.AddSanPhamForm;
import com.www.repository.SanPhamRepository;
import com.www.repository.TheLoaiRepository;
import com.www.service.TheLoaiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.*;


@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private TheLoaiRepository theLoaiRepository;
    @Autowired
    private SanPhamRepository sanPhamRepository;
    @Autowired
    private TheLoaiService theLoaiService;

    ObjectMapper objectMapper = new ObjectMapper();


    @GetMapping(value = {"", "/"})
    public String getProduct(Model model) {
//        List<TheLoai> theLoais = theLoaiService.getAllTheLoai();
        List<TheLoai> theLoais = theLoaiRepository.findAll();

        List<SanPham> sanPhams = sanPhamRepository.findAll();

        model.addAttribute("listTheLoai", theLoais);
        model.addAttribute("listSanPham", sanPhams);
        return "admin/product";
    }

    @GetMapping("/add")
    public String getAddProdcut() {
        return "admin/add-product";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public RedirectView postAddProduct(@RequestParam(required = true, value = "anhDaiDien") MultipartFile anhDaiDien, @RequestParam(required = true, value = "anhMauSanPham[]") MultipartFile[] anhMauSanPham, @RequestParam(required = true, value = "jsondata") String jsonData, HttpServletRequest request) throws IOException {
//        System.out.println(anhDaiDien.getBytes());
        byte[] anhDaiDienBytes = anhDaiDien.getBytes();
        Set<byte[]> listAnhMinhHoa = new HashSet<>();
        for (MultipartFile multipartFile : anhMauSanPham) {
            listAnhMinhHoa.add(multipartFile.getBytes());
        }
        AddSanPhamForm addSanPhamForm = (AddSanPhamForm) objectMapper.readValue(jsonData, AddSanPhamForm.class);

        System.out.println("log add san pham " + addSanPhamForm);

        SanPham sanPham = new SanPham();
        sanPham.setTen(addSanPhamForm.getTenSanPham());
        sanPham.setThuongHieu(addSanPhamForm.getTenThuongHieu());

        TheLoai theLoai = theLoaiRepository.findByTen(addSanPhamForm.getTheLoai());
        if (theLoai == null) {
            TheLoai theLoai1 = new TheLoai();
            theLoai1.setTen(addSanPhamForm.getTheLoai());
            theLoaiRepository.save(theLoai1);
            sanPham.setTheLoai(theLoaiRepository.findByTen(addSanPhamForm.getTheLoai()));
        } else {
            sanPham.setTheLoai(theLoai);
        }

        sanPham.setGia(addSanPhamForm.getGia());
        sanPham.setMoTa(addSanPhamForm.getMoTa());
        sanPham.setSoLuongTon(0);
        sanPham.setAnhDaiDien(anhDaiDienBytes);
        sanPham.setChiTiets(addSanPhamForm.getChiTiets());

        Set<MauSac> mauSacs = new HashSet<>();
        addSanPhamForm.getMauSacs().forEach(s -> {
            MauSac mauSac = new MauSac();
            mauSac.setTen(s);
            if (s.equalsIgnoreCase("Tráº¯ng"))
                mauSac.setMaMau("#FFFFFF");
            else if (s.equalsIgnoreCase("Ä�en"))
                mauSac.setMaMau("#000000");
            else if (s.equalsIgnoreCase("Xanh"))
                mauSac.setMaMau("#0000FF");
            else if (s.equalsIgnoreCase("Ä�á»�"))
                mauSac.setMaMau("#FF0000");
            else if (s.equalsIgnoreCase("TÃ­m"))
                mauSac.setMaMau("#800080");
            else if (s.equalsIgnoreCase("VÃ ng"))
                mauSac.setMaMau("#FFFF00");
            else if (s.equalsIgnoreCase("NÃ¢u"))
                mauSac.setMaMau("#660000");
            else
                mauSac.setMaMau("#F4F4F4");
            mauSacs.add(mauSac);
        });

        sanPham.setMauSacs(mauSacs);

        sanPham.setListHinh(listAnhMinhHoa);

//        System.out.println("log san pham "+sanPham);

        sanPhamRepository.save(sanPham);

        return new RedirectView(request.getContextPath() + "/product");
    }

}
