package com.www.service;

import com.www.entity.TheLoai;
import com.www.repository.TheLoaiRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

import static org.springframework.transaction.annotation.Propagation.REQUIRES_NEW;

@Service
public class TheLoaiService {

    @Autowired
    private TheLoaiRepository theLoaiRepository;

    public List<TheLoai> getAllTheLoai() {
        List<TheLoai> theLoais = new ArrayList<>();
        theLoaiRepository.getAllTheLoai().forEach(theLoai -> {
            theLoais.add(theLoai);
        });
        return theLoais;
    }
}
