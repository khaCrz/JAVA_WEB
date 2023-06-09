package com.nike.nike2.controller;

import com.nike.nike2.bean.Item;
import com.nike.nike2.bean.OrderDetail;
import com.nike.nike2.service.OrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin("*")
@RequestMapping( "/api/v1/orderdetail")
public class OrderDetailController {
    @Autowired
    OrderDetailService service;

    @GetMapping("/{id}")
    public ResponseEntity<List<OrderDetail>> findAllItems(@PathVariable(value = "id") Integer orderid) {
        return new ResponseEntity<List<OrderDetail>>(service.getOrderDetailsByOrderId(orderid), HttpStatus.OK);
    }
}
