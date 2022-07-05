package com.www.entity;

import org.hibernate.annotations.Nationalized;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "the_loai")
public class TheLoai implements Serializable {

    private static final long serialVersionUID = -5499954539471555074L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private long id;

    @Column(name = "ten", nullable = false)
    @Nationalized
    private String ten;

    @OneToMany(mappedBy = "theLoai", fetch = FetchType.LAZY)
    private List<SanPham> sanPhams;

    public TheLoai() {
    }

    public TheLoai(long id, String ten, List<SanPham> sanPhams) {
        this.id = id;
        this.ten = ten;
        this.sanPhams = sanPhams;
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

    public List<SanPham> getSanPhams() {
        return sanPhams;
    }

    public void setSanPhams(List<SanPham> sanPhams) {
        this.sanPhams = sanPhams;
    }

    @Override
    public String toString() {
        return "TheLoai{" +
                "id=" + id +
                ", ten='" + ten + '\'' +
                '}';
    }
}
