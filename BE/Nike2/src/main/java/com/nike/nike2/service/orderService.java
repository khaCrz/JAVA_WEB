package com.nike.nike2.service;

import com.nike.nike2.bean.Item;
import com.nike.nike2.bean.order;

import java.util.List;
import java.util.Optional;

public interface orderService {

    public List<order> findAll();

    public order saveOrder(order o);

    order findById(Integer id);
}
