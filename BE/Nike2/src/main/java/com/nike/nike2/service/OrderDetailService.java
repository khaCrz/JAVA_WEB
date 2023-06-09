package com.nike.nike2.service;

import com.nike.nike2.bean.OrderDetail;

import java.util.List;

public interface OrderDetailService {

    public List<OrderDetail> getOrderDetailsByOrderId(int orderId);

    public OrderDetail save(OrderDetail od);

    public List<OrderDetail> findAll();

    public void delete(OrderDetail od);
}
