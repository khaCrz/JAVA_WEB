package com.nike.nike2.service;

import com.nike.nike2.bean.Type;
import com.nike.nike2.repository.TypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class TypeServiceImp implements TypeService {

    @Autowired
    private TypeRepository repo;
    @Override
    public List<Type> findAll() {
        return repo.findAll();
    }
}
