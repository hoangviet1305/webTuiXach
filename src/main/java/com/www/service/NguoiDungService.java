package com.www.service;

import com.www.entity.NguoiDung;
import com.www.repository.NguoiDungRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NguoiDungService {
    @Autowired
    private NguoiDungRepository nguoiDungRepository;

    public boolean saveNguoiDung(NguoiDung nguoiDung) {
        try {
            nguoiDungRepository.save(nguoiDung);
            return true;
        }catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

	

}
