package com.www.entity;

import org.hibernate.annotations.Nationalized;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;
import java.util.Set;

@Entity
@Table(name = "HOA_DON")
public class HoaDon implements Serializable {
    private static final long serialVersionUID = -7529811922026778788L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private long id;

    @Column(name = "thoi_gian_lap", nullable = false)
    private Calendar thoiGianLap;

    @Column(name = "trang_thai", nullable = false)
    @Enumerated(EnumType.STRING)
    @Nationalized
    private TrangThai trangThai;

    @Column(name = "thoi_gian_giao")
    private Date date;

    @ManyToOne
    @JoinColumn(name = "nguoi_dung_id", nullable = false)
    private NguoiDung nguoiDung;

    @ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(name = "chi_tiet_hoa_don_hoa_don", joinColumns = @JoinColumn(name = "hoa_don_id"))
    private Set<ChiTietHoaDon> chiTietHoaDons;

    @Override
    public String toString() {
        return "HoaDon{" +
                "id='" + id + '\'' +
                ", thoiGianLap=" + thoiGianLap +
                ", trangThai=" + trangThai +
                ", date=" + date +
                ", nguoiDung=" + nguoiDung +
                '}';
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Calendar getThoiGianLap() {
        return thoiGianLap;
    }

    public void setThoiGianLap(Calendar thoiGianLap) {
        this.thoiGianLap = thoiGianLap;
    }

    public TrangThai getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(TrangThai trangThai) {
        this.trangThai = trangThai;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
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

    public HoaDon() {
    }

    public HoaDon(long id, Calendar thoiGianLap, TrangThai trangThai, Date date, NguoiDung nguoiDung) {
        this.id = id;
        this.thoiGianLap = thoiGianLap;
        this.trangThai = trangThai;
        this.date = date;
        this.nguoiDung = nguoiDung;
    }
}
