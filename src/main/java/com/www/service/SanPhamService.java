package com.www.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.www.entity.SanPham;
import com.www.repository.SanPhamRepository;


@Service
public class SanPhamService {
	@Autowired
	private SanPhamRepository sanPhamRepository;

	public List<SanPham>  getAllSP() {
		List<SanPham> list= new ArrayList<>();
		Iterable<SanPham> iterableSP= sanPhamRepository.findAll();
		Iterator<SanPham> iteratorSP = iterableSP.iterator();
		while (iteratorSP.hasNext()) {
			list.add(iteratorSP.next());
		}
		return list;
	}
	public boolean addSP(SanPham sanPham) {
		try {
			sanPhamRepository.save(sanPham);
			System.out.println("Them thanh cong "+ sanPham);
			return true;
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	public void updateSp(SanPham sanPham) {
		sanPhamRepository.save(sanPham);
		System.out.println("Update thanh cong "+ sanPham);
	}
	public void deleteSP(long id) {
		sanPhamRepository.deleteById(id);	
		System.out.println("Update thanh cong "+ id);
	}
//	public Optional<SanPham> findOneSP(long id) {
//		Optional<SanPham> sp = null;
//		sp = sanPhamRepository.findById(id);
//		return sp;
//	}
//	
	
//
//	public Optional<SanPham> findOneSP(long id) {
//		Optional<SanPham> sp = null;
//		sp = sanPhamRepository.findById(id);
//		return sp;
//	}
//	public List<SanPham> findAllSP(String name) {
//		List<SanPham> sp = null;
//		sp = sanPhamRepository.findListNameSP(name);
//		return sp;
//	}
}
