package com.www.entity;

import com.www.Util.UtilClass;
import org.hibernate.annotations.Nationalized;
import org.springframework.beans.factory.annotation.Autowired;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Arrays;
import java.util.Base64;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "san_pham")
public class SanPham implements Serializable {

    private static final long serialVersionUID = 4659917672555361897L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private long id;

    @Column(name = "ten", nullable = false)
    @Nationalized
    private String ten;

    @Column(name = "thuong_hieu", nullable = true)
    @Nationalized
    private String thuongHieu;

    @Column(name = "gia", nullable = false)
    private double gia;

    @Column(name = "mo_ta")
    @Nationalized
    private String moTa;

    @Lob
    @Column(name = "anhDaiDien")
    private byte[] anhDaiDien;

//    @Lob
    @ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(name = "hinh_anh", joinColumns = @JoinColumn(name = "id"))
    private Set<byte[]> listHinh = new HashSet<>();

    @ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(name = "chi_tiet", joinColumns = @JoinColumn(name = "san_pham_id"))
    private Set<ChiTiet> chiTiets;

    @ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(name = "mau_sac", joinColumns = @JoinColumn(name = "san_pham_id"))
    private Set<MauSac> mauSacs;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "the_loai_id", nullable = false)
    private TheLoai theLoai;

    @Column(name = "so_luong_ton", nullable = false)
    private int soLuongTon;


    public SanPham() {
    }

    public SanPham(long id, String ten, String thuongHieu, double gia, String moTa, byte[] anhDaiDien, Set<byte[]> listHinh, Set<ChiTiet> chiTiets, Set<MauSac> mauSacs, TheLoai theLoai, int soLuongTon) {
        this.id = id;
        this.ten = ten;
        this.thuongHieu = thuongHieu;
        this.gia = gia;
        this.moTa = moTa;
        this.anhDaiDien = anhDaiDien;
        this.listHinh = listHinh;
        this.chiTiets = chiTiets;
        this.mauSacs = mauSacs;
        this.theLoai = theLoai;
        this.soLuongTon = soLuongTon;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getThuongHieu() {
        return thuongHieu;
    }

    public void setThuongHieu(String thuongHieu) {
        this.thuongHieu = thuongHieu;
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

    public byte[] getAnhDaiDien() {
        return anhDaiDien;
    }

    public void setAnhDaiDien(byte[] anhDaiDien) {
        this.anhDaiDien = anhDaiDien;
    }

    public Set<byte[]> getListHinh() {
        return listHinh;
    }

    public void setListHinh(Set<byte[]> listHinh) {
        this.listHinh = listHinh;
    }

    public Set<ChiTiet> getChiTiets() {
        return chiTiets;
    }

    public void setChiTiets(Set<ChiTiet> chiTiets) {
        this.chiTiets = chiTiets;
    }

    public Set<MauSac> getMauSacs() {
        return mauSacs;
    }

    public void setMauSacs(Set<MauSac> mauSacs) {
        this.mauSacs = mauSacs;
    }

    public TheLoai getTheLoai() {
        return theLoai;
    }

    public void setTheLoai(TheLoai theLoai) {
        this.theLoai = theLoai;
    }

    public int getSoLuongTon() {
        return soLuongTon;
    }

    public void setSoLuongTon(int soLuongTon) {
        this.soLuongTon = soLuongTon;
    }

    @Override
    public String toString() {
        return "SanPham{" +
                "id=" + id +
                ", ten='" + ten + '\'' +
                ", thuongHieu='" + thuongHieu + '\'' +
                ", gia=" + gia +
                ", moTa='" + moTa + '\'' +
                ", anhDaiDien=" + Arrays.toString(anhDaiDien) +
                ", listHinh=" + listHinh +
                ", chiTiets=" + chiTiets +
                ", mauSacs=" + mauSacs +
                ", theLoai=" + theLoai +
                ", soLuongTon=" + soLuongTon +
                '}';
    }

    public String getAnhDaiDienBase64() {
        return Base64.getEncoder().encodeToString(this.getAnhDaiDien());
    }

    public String getGiaFormat() {
        UtilClass utilClass = new UtilClass();
        return utilClass.formatMoneyVnd(this.getGia());
    }

    public Set<String> getListHinhBase64() {
        Set<String> hinhAnh = new HashSet<>();
        this.getListHinh().forEach(bytes -> {
            hinhAnh.add(Base64.getEncoder().encodeToString(bytes));
        });
        return hinhAnh;
    }
}
