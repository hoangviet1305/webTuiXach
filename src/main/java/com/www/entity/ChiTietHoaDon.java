package com.www.entity;

import com.www.Util.UtilClass;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class ChiTietHoaDon implements Serializable {

    private static final long serialVersionUID = -7151134584452098982L;
    @Column(name = "so_luong", nullable = false)
    private int soLuong;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "san_pham_id")
    private SanPham sanPham;

    @Column(name = "gia_ban", nullable = false)
    public double tinhGiaBan() {
        return this.getSanPham().getGia() * 1.4;
    }
    public String tinhGiaBanFormat() {
        return new UtilClass().formatMoneyVnd(this.tinhGiaBan());
    }
    public ChiTietHoaDon() {
    }

    public ChiTietHoaDon(int soLuong, SanPham sanPham) {
        this.soLuong = soLuong;
        this.sanPham = sanPham;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public SanPham getSanPham() {
        return sanPham;
    }

    public void setSanPham(SanPham sanPham) {
        this.sanPham = sanPham;
    }

    @Override
    public String toString() {
        return "ChiTietHoaDon{" +
                "soLuong=" + soLuong +
                ", sanPham=" + sanPham +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ChiTietHoaDon)) return false;
        ChiTietHoaDon that = (ChiTietHoaDon) o;
        return getSoLuong() == that.getSoLuong() && Objects.equals(getSanPham(), that.getSanPham());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getSoLuong(), getSanPham());
    }

    public double tinhTienChiTietHoaDon() {
        return tinhGiaBan() * this.getSoLuong();
    }

    public String getTongTienFormat() {
        UtilClass utilClass = new UtilClass();
        return utilClass.formatMoneyVnd(this.tinhTienChiTietHoaDon());
    }
}
