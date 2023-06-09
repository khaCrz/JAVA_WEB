package com.nike.nike2.service;

import com.nike.nike2.bean.Item;

import java.util.List;
import java.util.Optional;

public interface ItemService {
    public List<Item> findAll();

    public Item save(Item i);

    Optional<Item> findById(Integer id);
}
