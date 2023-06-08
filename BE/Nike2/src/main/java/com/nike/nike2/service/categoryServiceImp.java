package com.nike.nike2.service;

import com.nike.nike2.bean.Category;
import com.nike.nike2.repository.categoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class categoryServiceImp implements categoryService {
    @Autowired
    private categoryRepository repo;
    @Override
    public List<Category> findAll() {
        return repo.findAll();
    }
}
