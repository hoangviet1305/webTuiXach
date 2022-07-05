package com.www.form;

import com.www.entity.ChiTiet;

import java.util.List;
import java.util.Map;
import java.util.Set;

public class AddSanPhamForm {
    private String tenSanPham;
    private String tenThuongHieu;
    private String theLoai;
    private double gia;
    private String moTa;
    private Set<String> mauSacs;
    private Set<ChiTiet> chiTiets;

    public AddSanPhamForm() {
    }

    public AddSanPhamForm(String tenSanPham, String tenThuongHieu, String theLoai, double gia, String moTa, Set<String> mauSacs, Set<ChiTiet> chiTiets) {
        this.tenSanPham = tenSanPham;
        this.tenThuongHieu = tenThuongHieu;
        this.theLoai = theLoai;
        this.gia = gia;
        this.moTa = moTa;
        this.mauSacs = mauSacs;
        this.chiTiets = chiTiets;
    }

    public String getTenSanPham() {
        return tenSanPham;
    }

    public void setTenSanPham(String tenSanPham) {
        this.tenSanPham = tenSanPham;
    }

    public String getTenThuongHieu() {
        return tenThuongHieu;
    }

    public void setTenThuongHieu(String tenThuongHieu) {
        this.tenThuongHieu = tenThuongHieu;
    }

    public String getTheLoai() {
        return theLoai;
    }

    public void setTheLoai(String theLoai) {
        this.theLoai = theLoai;
    }

    public double getGia() {
        return gia;
    }

    public void setGia(double gia) {
        this.gia = gia;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public Set<String> getMauSacs() {
        return mauSacs;
    }

    public void setMauSacs(Set<String> mauSacs) {
        this.mauSacs = mauSacs;
    }

    public Set<ChiTiet> getChiTiets() {
        return chiTiets;
    }

    public void setChiTiets(Set<ChiTiet> chiTiets) {
        this.chiTiets = chiTiets;
    }

    @Override
    public String toString() {
        return "AddSanPhamForm{" +
                "tenSanPham='" + tenSanPham + '\'' +
                ", tenThuongHieu='" + tenThuongHieu + '\'' +
                ", theLoai='" + theLoai + '\'' +
                ", gia=" + gia +
                ", moTa='" + moTa + '\'' +
                ", mauSacs=" + mauSacs +
                ", chiTiets=" + chiTiets +
                '}';
    }
}
