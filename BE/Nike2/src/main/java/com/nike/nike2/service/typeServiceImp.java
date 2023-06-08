package com.nike.nike2.service;

import com.nike.nike2.bean.type;
import com.nike.nike2.repository.itemRepository;
import com.nike.nike2.repository.typeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class typeServiceImp implements typeService {

    @Autowired
    private typeRepository repo;
    @Override
    public List<type> findAll() {
        return repo.findAll();
    }
}
