package com.www.entity;

import org.hibernate.annotations.Nationalized;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class ChiTiet implements Serializable {

    private static final long serialVersionUID = 3248338246618803196L;
    @Column(name = "thuoc_tinh", nullable = false)
    @Nationalized
    private String key;

    @Column(name = "gia_tri", nullable = false)
    @Nationalized
    private String value;

    @Override
    public String toString() {
        return "ChiTiet{" +
                "key='" + key + '\'' +
                ", value='" + value + '\'' +
                '}';
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public ChiTiet() {
    }

    public ChiTiet(String key, String value) {
        this.key = key;
        this.value = value;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ChiTiet)) return false;
        ChiTiet chiTiet = (ChiTiet) o;
        return Objects.equals(getKey(), chiTiet.getKey()) && Objects.equals(getValue(), chiTiet.getValue());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getKey(), getValue());
    }
}
