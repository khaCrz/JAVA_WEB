package com.nike.nike2.controller;


import com.nike.nike2.service.ItemServiceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import com.nike.nike2.bean.Item;

import java.util.List;

@RestController
@CrossOrigin("*")
@RequestMapping( "/api/v1/item")
public class ItemController {

    @Autowired
    private ItemServiceImp ItemService;

    @GetMapping("")
    public ResponseEntity<List<Item>> findAllItems() {
        return new ResponseEntity<List<Item>>(ItemService.findAll(), HttpStatus.OK);
    }

    @GetMapping("filter")
    public ResponseEntity<List<Item>> findFilterItems(@RequestParam("cate") Integer cate, @RequestParam("type") Integer type) {
        System.out.println(cate + "-" + type);
        if (cate == 0 && type == 0) {
            return new ResponseEntity<List<Item>>(ItemService.findAll(), HttpStatus.OK);
        }
        if(cate != 0 && type != 0){
            return new ResponseEntity<List<Item>>(ItemService.findAll().stream().filter(i -> i.getTypeItem().getTypeId() == type && i.getCategoryItem().getCategoryId() == cate).toList(), HttpStatus.OK);
        }
        else {
            if (cate == 0) {
                return new ResponseEntity<List<Item>>(ItemService.findAll().stream().filter(i -> i.getTypeItem().getTypeId() == type).toList(), HttpStatus.OK);
            } else {
                return new ResponseEntity<List<Item>>(ItemService.findAll().stream().filter(i -> i.getCategoryItem().getCategoryId() == cate).toList(), HttpStatus.OK);
            }
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<Item> findItemById(@PathVariable(value = "id") int id) {
        return new ResponseEntity<Item>(ItemService.findById(id).get(), HttpStatus.OK);
    }

    @PostMapping("")
    public Item saveItem(@RequestBody Item i) {
        System.out.println(i);
        return ItemService.save(i);
    }

    @PutMapping("")
    public Item updateItem(@RequestBody Item i) {
        System.out.println(i);
        return ItemService.save(i);
    }
}
