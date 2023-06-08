package com.nike.nike2.service;

import com.nike.nike2.bean.order;
import com.nike.nike2.repository.orderRespository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class orderServiceImp implements orderService{

    @Autowired
    private orderRespository repo;

    @Override
    public List<order> findAll() {
        return repo.findAll();
    }

    @Override
    public order saveOrder(order o) {
        return repo.save(o);
    }

    @Override
    public order findById(Integer id) {
        return repo.findById(id).get();
    }
}
