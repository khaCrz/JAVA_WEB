package com.nike.nike2.service;

import com.nike.nike2.bean.Order;
import com.nike.nike2.repository.OrderRespository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImp implements OrderService {

    @Autowired
    private OrderRespository repo;

    @Override
    public List<Order> findAll() {
        return repo.findAll();
    }

    @Override
    public Order saveOrder(Order o) {
        return repo.save(o);
    }

    @Override
    public Order findById(Integer id) {
        return repo.findById(id).get();
    }
}
