import { Component, OnInit } from '@angular/core';
import { OrderService } from '../services/order.service';
import { NgForm } from '@angular/forms';
import { orderdetail } from '../models/orderdetail';
import { history } from '../models/history';
import { HistoryService } from '../services/history.service';
import { Router } from '@angular/router';
@Component({
  selector: 'app-order-detail',
  templateUrl: './order-detail.component.html',
  styleUrls: ['./order-detail.component.css'],
})
export class OrderDetailComponent implements OnInit {
  histories: history[] = [];
  subTotal: number = 0;
  total: number = 0;
  fee: number = 0.2;
  orderCheck: number[] = [];
  OrderDetails: orderdetail[] = [];

  constructor(
    private historyService: HistoryService,
    private orderService: OrderService,
    private route: Router
  ) { }
  ngOnInit(): void {
    this.historyService.getHistorys().subscribe((data) => {
      this.histories = data;
    });
    this.orderCheck = [];
    this.orderService.getOrderDetailCurrent().subscribe((data) => {
      this.OrderDetails = data;
      for (let i = 0; i < this.OrderDetails.length; i++) {
        this.subTotal += this.OrderDetails[i].quantity * this.OrderDetails[i].item.price
      }
    });
    this.updatePrice();
  }

  postForm(f: NgForm) {
    const url = '?id=' + f.value['id'] + '&quantity=' + f.value['value'];
    this.historyService.editHistory(url).subscribe((data) => {
      this.ngOnInit();
    });
  }

  checkBoxClick(id: number) {
    if (this.orderCheck.includes(id)) {
      this.orderCheck.splice(this.orderCheck.indexOf(id), 1);
    } else {
      this.orderCheck.push(id);
    }
    console.log(this.orderCheck);
    this.updatePrice();
  }

  updatePrice() {
    let price = this.subTotal
    for (let i = 0; i < this.histories.length; i++) {
      if (this.orderCheck.includes(this.histories[i].historyId)) {
        price +=
          this.histories[i].item.price * this.histories[i].quantity;
      }
    }
    this.total = this.fee + price;
  }

  checkOut() {
    if (this.orderCheck.length > 0) {
      let histories: history[] = []
      for (let i = 0; i < this.histories.length; i++) {
        if (this.orderCheck.includes(this.histories[i].historyId)) {
          histories.push(this.histories[i])
        }
      }
      this.orderService.checkout(histories).subscribe((data) => {
        // this.route.navigateByUrl('/order');
        this.histories = data
        alert('Checkout completed successfully')
        this.ngOnInit();
      });
    } else {
      alert('You need to choose a item to checkout.')
    }



  }

  delete(id: number) {
    this.orderService.deleteHistory(id).subscribe((data) => {
      alert('delete completed successfully')
      this.ngOnInit();
    });
  }

  deleteOd(od: orderdetail) {
    const url = '?idod=' + od.id.orderId + '&idi=' + od.id.itemId

    this.orderService.deleteOrderDetail(url).subscribe((data) => {
      alert('delete completed successfully')
      this.ngOnInit();
    });
  }
}
