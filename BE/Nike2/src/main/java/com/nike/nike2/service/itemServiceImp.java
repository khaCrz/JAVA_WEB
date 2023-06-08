package com.nike.nike2.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.nike.nike2.bean.Item;
import com.nike.nike2.repository.itemRepository;

import java.util.List;
import java.util.Optional;

@Service
public class itemServiceImp implements itemService{
    @Autowired
    private itemRepository repo;
    @Override
    public List<Item> findAll() {
        return repo.findAll();
    }

    @Override
    public Item save(Item i) {
        return repo.save(i);
    }

    @Override
    public Optional<Item> findById(Integer id) {
        return repo.findById(id);
    }
}
