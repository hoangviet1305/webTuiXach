package com.www.form;

public class ImformationForm {
    private int id;
    private String hoTenDem;
    private String ten;
    private String soDienThoai;
    private String ngaySinh;
    private boolean gioiTinh;

    public ImformationForm() {
    }

    public ImformationForm(int id, String hoTenDem, String ten, String soDienThoai, String ngaySinh, boolean gioiTinh) {
        this.id = id;
        this.hoTenDem = hoTenDem;
        this.ten = ten;
        this.soDienThoai = soDienThoai;
        this.ngaySinh = ngaySinh;
        this.gioiTinh = gioiTinh;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHoTenDem() {
        return hoTenDem;
    }

    public void setHoTenDem(String hoTenDem) {
        this.hoTenDem = hoTenDem;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }

    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }

    public String getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(String ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public boolean isGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(boolean gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    @Override
    public String toString() {
        return "ImformationForm{" +
                "id=" + id +
                ", hoTenDem='" + hoTenDem + '\'' +
                ", ten='" + ten + '\'' +
                ", soDienThoai='" + soDienThoai + '\'' +
                ", ngaySinh='" + ngaySinh + '\'' +
                ", gioiTinh=" + gioiTinh +
                '}';
    }
}
