import { Component, OnInit } from '@angular/core';
import { order } from '../models/order';
import { OrderService } from '../services/order.service';
import { NgForm } from '@angular/forms';
@Component({
  selector: 'app-order-detail',
  templateUrl: './order-detail.component.html',
  styleUrls: ['./order-detail.component.css']
})
export class OrderDetailComponent implements OnInit {
  orders: order[] = []
  subTotal: number = 0;
  total!: number;
  fee: number = 0.2
  orderCheck: number[] = []

  constructor(private orderService: OrderService) {

  }
  ngOnInit(): void {
    this.orderService.getOrders().subscribe(data => {
      this.orders = data
    })
    this.orderCheck = []
    this.updatePrice()

  }

  postForm(f: NgForm) {
    const url = "?id=" + f.value['id'] + "&quantity=" + f.value['value'];
    this.orderService.editOrder(url).subscribe(data => {
      this.ngOnInit()
    })
  }

  checkBoxClick(id: number) {
    if (this.orderCheck.includes(id)) {
      this.orderCheck.splice(this.orderCheck.indexOf(id), 1);
    } else {
      this.orderCheck.push(id);
    }
    console.log(this.orderCheck);
    this.updatePrice()
  }

  updatePrice() {
    this.subTotal = 0
    for (let i = 0; i < this.orders.length; i++) {
      if (this.orderCheck.includes(this.orders[i].order_id)) {

        this.subTotal += (this.orders[i].item.price * this.orders[i].quantity)
        console.log(this.total)
      }
    }
    this.total = this.fee + this.subTotal
  }

  updateQuantity(order: order) {
    console.log(order.quantity)
  }

  updateSingleQuantity(quantity: number) {
    console.log(quantity)
  }

}
