package com.www.repository;

import com.www.entity.TheLoai;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository
@Transactional(readOnly = true, noRollbackFor = EmptyResultDataAccessException.class)
public class TheLoaiRepositoryImpl implements TheLoaiRepositoryCustom{

    @PersistenceContext
    EntityManager entityManager;

    @Override
    public List<TheLoai> getAllTheLoai() {
        String sql = "SELECT [id]" +
                "      ,[ten]" +
                "  FROM [vpp_store].[dbo].[the_loai]";
        Query query = entityManager.createNativeQuery(sql, TheLoai.class);
        return query.getResultList();
    }
}
