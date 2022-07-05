package com.www.repository;

import com.www.entity.TheLoai;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TheLoaiRepository extends CrudRepository<TheLoai, Long>, TheLoaiRepositoryCustom {
    TheLoai findByTen(String name);
    List<TheLoai> findAll();
}
