package com.nike.nike2.service;

import com.nike.nike2.bean.OrderDetail;
import com.nike.nike2.repository.OrderDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderDetailServiceImp implements OrderDetailService {

    @Autowired
    OrderDetailRepository repo;

    @Override
    public List<OrderDetail> getOrderDetailsByOrderId(int orderId) {
        return repo.getOrderDetailsByOrderId(orderId);
    }

    @Override
    public OrderDetail save(OrderDetail od) {
        return repo.save(od);
    }

    @Override
    public List<OrderDetail> findAll() {
        return repo.findAll();
    }

    @Override
    public void delete(OrderDetail od) {
        repo.delete(od);
    }
}
