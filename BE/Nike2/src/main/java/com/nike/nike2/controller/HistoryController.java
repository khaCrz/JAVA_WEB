package com.nike.nike2.controller;

import com.nike.nike2.bean.History;
import com.nike.nike2.bean.Order;
import com.nike.nike2.service.HistoryServiceImp;
import com.nike.nike2.service.ItemServiceImp;
import com.nike.nike2.service.OrderDetailServiceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@CrossOrigin("*")
@RequestMapping( "/api/v1/history")
public class HistoryController {

    @Autowired
    HistoryServiceImp service;

    @Autowired
    private ItemServiceImp ItemService;

    @GetMapping("")
    public ResponseEntity<List<History>> findAllHistories() {
        return new ResponseEntity<List<History>>(service.findAll(), HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public void DeleteHistory(@PathVariable(value = "id") int id) {
        service.delete(id);
    }

    @PostMapping("/{id}")
    public History saveOrUpdateOrder(@PathVariable(value = "id") int itemid) {
        History history = null;
        if (service.findAll().stream().filter(h->h.getItem().getItemId() == itemid).count() > 0) {
            history = service.findById(service.findAll().stream().filter(h->h.getItem().getItemId() == itemid).findFirst().get().getHistoryId()).get();
            history.setQuantity(history.getQuantity() + 1);
        } else {
            history = new History();
            history.setQuantity(1);
            history.setItemId(itemid);
            history.setItem(ItemService.findById(itemid).get());
        }
        System.out.println(history);
        return new ResponseEntity<History>(service.saveHistory(history), HttpStatus.OK).getBody();
    }

    @PutMapping("/update")
    public History updateHistory(@RequestParam("id") Integer id, @RequestParam("quantity") Integer quantity) {
        System.out.println(id + "_" + quantity);
        History h = service.findById(id).get();
        System.out.println(h);
        h.setQuantity(quantity);
        return new ResponseEntity<History>(service.saveHistory(h), HttpStatus.OK).getBody();
    }


}
