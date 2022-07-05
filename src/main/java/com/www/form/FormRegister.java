package com.www.form;

public class FormRegister {
    private String hoTenDem;
    private String ten;
    private String soDienThoai;
    private String email;
    private String matKhau;
    private String nhapLaiMatKhau;

    @Override
    public String toString() {
        return "FormRegister{" +
                "hoTenDem='" + hoTenDem + '\'' +
                ", ten='" + ten + '\'' +
                ", soDienThoai='" + soDienThoai + '\'' +
                ", email='" + email + '\'' +
                ", matKhau='" + matKhau + '\'' +
                ", nhapLaiMatKhau='" + nhapLaiMatKhau + '\'' +
                '}';
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public String getNhapLaiMatKhau() {
        return nhapLaiMatKhau;
    }

    public void setNhapLaiMatKhau(String nhapLaiMatKhau) {
        this.nhapLaiMatKhau = nhapLaiMatKhau;
    }

    public FormRegister() {
    }

    public FormRegister(String hoTenDem, String ten, String soDienThoai, String email, String matKhau, String nhapLaiMatKhau) {
        this.hoTenDem = hoTenDem;
        this.ten = ten;
        this.soDienThoai = soDienThoai;
        this.email = email;
        this.matKhau = matKhau;
        this.nhapLaiMatKhau = nhapLaiMatKhau;
    }
}
