package com.www.form;

public class AddToCartForm {
    private int maSanPham;
    private int soLuong;

    public AddToCartForm() {
    }

    public AddToCartForm(int maSanPham, int soLuong) {
        this.maSanPham = maSanPham;
        this.soLuong = soLuong;
    }

    public int getMaSanPham() {
        return maSanPham;
    }

    public void setMaSanPham(int maSanPham) {
        this.maSanPham = maSanPham;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    @Override
    public String toString() {
        return "AddToCartForm{" +
                "maSanPham=" + maSanPham +
                ", soLuong=" + soLuong +
                '}';
    }
}
