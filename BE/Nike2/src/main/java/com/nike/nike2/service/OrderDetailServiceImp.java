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
}
