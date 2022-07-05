package com.www.entity;

import com.www.Util.UtilClass;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "gio_hang")
public class Cart implements Serializable {

    private static final long serialVersionUID = 7290094922898722405L;
    @Id
    @OneToOne
    @JoinColumn(name = "nguoi_dung_id", nullable = false)
    private NguoiDung nguoiDung;

    @ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(name = "chi_tiet_hoa_don_gio_hang", joinColumns = @JoinColumn(name = "gio_hang_id"))
    private Set<ChiTietHoaDon> chiTietHoaDons = new HashSet<>();


    public Cart() {
    }

    public Cart(NguoiDung nguoiDung, Set<ChiTietHoaDon> chiTietHoaDons) {
        this.nguoiDung = nguoiDung;
        this.chiTietHoaDons = chiTietHoaDons;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public NguoiDung getNguoiDung() {
        return nguoiDung;
    }

    public void setNguoiDung(NguoiDung nguoiDung) {
        this.nguoiDung = nguoiDung;
    }

    public Set<ChiTietHoaDon> getChiTietHoaDons() {
        return chiTietHoaDons;
    }

    public void setChiTietHoaDons(Set<ChiTietHoaDon> chiTietHoaDons) {
        this.chiTietHoaDons = chiTietHoaDons;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "nguoiDung=" + nguoiDung +
                ", chiTietHoaDons=" + chiTietHoaDons +
                '}';
    }

    public double tinhTongTienTrongCart() {
        double sum = 0;
        for (ChiTietHoaDon chiTietHoaDon : this.getChiTietHoaDons()) {
            sum += chiTietHoaDon.tinhTienChiTietHoaDon();
        }
        return sum;
    }

    public String getTongTienChiTietHoaDonFormat() {
        return new UtilClass().formatMoneyVnd(this.tinhTongTienTrongCart());
    }
}
