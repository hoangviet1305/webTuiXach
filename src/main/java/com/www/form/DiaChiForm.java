package com.www.form;

public class DiaChiForm {
    private String tenNguoiNhan;
    private String tinhThanhPho;
    private String quanHuyen;
    private String phuongXa;
    private String chiTiet;
    private String soDienThoai;
    private int label;

    public DiaChiForm() {
    }

    public DiaChiForm(String tenNguoiNhan, String tinhThanhPho, String quanHuyen, String phuongXa, String chiTiet, String soDienThoai, int label) {
        this.tenNguoiNhan = tenNguoiNhan;
        this.tinhThanhPho = tinhThanhPho;
        this.quanHuyen = quanHuyen;
        this.phuongXa = phuongXa;
        this.chiTiet = chiTiet;
        this.soDienThoai = soDienThoai;
        this.label = label;
    }

    public String getTenNguoiNhan() {
        return tenNguoiNhan;
    }

    public void setTenNguoiNhan(String tenNguoiNhan) {
        this.tenNguoiNhan = tenNguoiNhan;
    }

    public String getTinhThanhPho() {
        return tinhThanhPho;
    }

    public void setTinhThanhPho(String tinhThanhPho) {
        this.tinhThanhPho = tinhThanhPho;
    }

    public String getQuanHuyen() {
        return quanHuyen;
    }

    public void setQuanHuyen(String quanHuyen) {
        this.quanHuyen = quanHuyen;
    }

    public String getPhuongXa() {
        return phuongXa;
    }

    public void setPhuongXa(String phuongXa) {
        this.phuongXa = phuongXa;
    }

    public String getChiTiet() {
        return chiTiet;
    }

    public void setChiTiet(String chiTiet) {
        this.chiTiet = chiTiet;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }

    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }

    public int getLabel() {
        return label;
    }

    public void setLabel(int label) {
        this.label = label;
    }

    @Override
    public String toString() {
        return "DiaChiForm{" +
                "tenNguoiNhan='" + tenNguoiNhan + '\'' +
                ", tinhThanhPho='" + tinhThanhPho + '\'' +
                ", quanHuyen='" + quanHuyen + '\'' +
                ", phuongXa='" + phuongXa + '\'' +
                ", chiTiet='" + chiTiet + '\'' +
                ", soDienThoai='" + soDienThoai + '\'' +
                ", label=" + label +
                '}';
    }
}
