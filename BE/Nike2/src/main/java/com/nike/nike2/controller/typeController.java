package com.nike.nike2.controller;

import com.nike.nike2.bean.Item;
import com.nike.nike2.bean.type;
import com.nike.nike2.service.itemService;
import com.nike.nike2.service.typeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin("*")
@RequestMapping( "/api/v1/type")
public class typeController {
    @Autowired
    private typeService Service;

    @GetMapping("")
    public ResponseEntity<List<type>> findAllType() {
        return new ResponseEntity<List<type>>(Service.findAll(), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<type> findTypeById(@PathVariable(value = "id") int id) {
        return new ResponseEntity<type>(Service.findAll().get(id-1), HttpStatus.OK);
    }
}
