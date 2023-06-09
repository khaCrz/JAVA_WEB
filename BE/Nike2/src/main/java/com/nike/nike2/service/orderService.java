package com.nike.nike2.service;

import com.nike.nike2.bean.Order;

import java.util.List;

public interface OrderService {

    public List<Order> findAll();

    public Order saveOrder(Order o);

    Order findById(Integer id);
}
