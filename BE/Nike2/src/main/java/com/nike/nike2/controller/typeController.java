package com.nike.nike2.controller;

import com.nike.nike2.bean.Type;
import com.nike.nike2.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin("*")
@RequestMapping( "/api/v1/type")
public class TypeController {
    @Autowired
    private TypeService Service;

    @GetMapping("")
    public ResponseEntity<List<Type>> findAllType() {
        return new ResponseEntity<List<Type>>(Service.findAll(), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Type> findTypeById(@PathVariable(value = "id") int id) {
        return new ResponseEntity<Type>(Service.findAll().get(id-1), HttpStatus.OK);
    }
}
