package com.www.repository;

import com.www.entity.SanPham;
import com.www.entity.TheLoai;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SanPhamRepository extends CrudRepository<SanPham, Long> {
    List<SanPham> findAll();
    SanPham findById(long id);
    List<SanPham> findByTheLoai(TheLoai theLoai);

}
