package com.www.entity;

import org.hibernate.annotations.Nationalized;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Embeddable
public class DiaChi implements Serializable {
    private static final long serialVersionUID = -5694643530826830252L;

    @Column(name = "phuong_xa", nullable = false)
    @Nationalized
    private String phuongXa;

    @Column(name = "quan_huyen", nullable = false)
    @Nationalized
    private String quanHuyen;

    @Column(name = "tinh_thanh_pho", nullable = false)
    @Nationalized
    private String tinhThanhPho;

    @Column(name = "chi_tiet", nullable = false)
    @Nationalized
    private String chiTiet;

    @Column(name = "ten_nguoi_nhan", nullable = false)
    @Nationalized
    private String tenNguoiNhan;

    @Column(name = "so_dien_thoai")
    private String soDienThoai;

    @Enumerated(EnumType.STRING)
    @Column(name = "label")
    @Nationalized
    private LableAddress lableAddress;

    public DiaChi() {
    }

    public DiaChi(String phuongXa, String quanHuyen, String tinhThanhPho, String chiTiet, String tenNguoiNhan, String soDienThoai, LableAddress lableAddress) {
        this.phuongXa = phuongXa;
        this.quanHuyen = quanHuyen;
        this.tinhThanhPho = tinhThanhPho;
        this.chiTiet = chiTiet;
        this.tenNguoiNhan = tenNguoiNhan;
        this.soDienThoai = soDienThoai;
        this.lableAddress = lableAddress;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getPhuongXa() {
        return phuongXa;
    }

    public void setPhuongXa(String phuongXa) {
        this.phuongXa = phuongXa;
    }

    public String getQuanHuyen() {
        return quanHuyen;
    }

    public void setQuanHuyen(String quanHuyen) {
        this.quanHuyen = quanHuyen;
    }

    public String getTinhThanhPho() {
        return tinhThanhPho;
    }

    public void setTinhThanhPho(String tinhThanhPho) {
        this.tinhThanhPho = tinhThanhPho;
    }

    public String getChiTiet() {
        return chiTiet;
    }

    public void setChiTiet(String chiTiet) {
        this.chiTiet = chiTiet;
    }

    public String getTenNguoiNhan() {
        return tenNguoiNhan;
    }

    public void setTenNguoiNhan(String tenNguoiNhan) {
        this.tenNguoiNhan = tenNguoiNhan;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }

    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }

    public LableAddress getLableAddress() {
        return lableAddress;
    }

    public void setLableAddress(LableAddress lableAddress) {
        this.lableAddress = lableAddress;
    }

    @Override
    public String toString() {
        return "DiaChi{" +
                "phuongXa='" + phuongXa + '\'' +
                ", quanHuyen='" + quanHuyen + '\'' +
                ", tinhThanhPho='" + tinhThanhPho + '\'' +
                ", chiTiet='" + chiTiet + '\'' +
                ", tenNguoiNhan='" + tenNguoiNhan + '\'' +
                ", soDienThoai='" + soDienThoai + '\'' +
                ", lableAddress=" + lableAddress +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof DiaChi)) return false;
        DiaChi diaChi = (DiaChi) o;
        return Objects.equals(getPhuongXa(), diaChi.getPhuongXa()) && Objects.equals(getQuanHuyen(), diaChi.getQuanHuyen()) && Objects.equals(getTinhThanhPho(), diaChi.getTinhThanhPho()) && Objects.equals(getChiTiet(), diaChi.getChiTiet()) && Objects.equals(getTenNguoiNhan(), diaChi.getTenNguoiNhan()) && Objects.equals(getSoDienThoai(), diaChi.getSoDienThoai()) && getLableAddress() == diaChi.getLableAddress();
    }

    @Override
    public int hashCode() {
        return Objects.hash(getPhuongXa(), getQuanHuyen(), getTinhThanhPho(), getChiTiet(), getTenNguoiNhan(), getSoDienThoai(), getLableAddress());
    }
}
