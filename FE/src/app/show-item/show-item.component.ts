import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { AddEditComponent } from '../add-edit/add-edit.component';
import { ItemService } from '../services/item.service';
import { item } from '../models/item';
import { ActivatedRoute, Router } from '@angular/router';
import { order } from '../models/order';
import { OrderService } from '../services/order.service';

@Component({
  selector: 'app-show-item',
  templateUrl: './show-item.component.html',
  styleUrls: ['./show-item.component.css'],
})
export class ShowItemComponent implements OnInit {
  Item!: item;
  id!: string;
  Order!: order;
  constructor(
    private dialog: MatDialog,
    private Iservice: ItemService,
    private Oservice: OrderService,
    private activateRouter: ActivatedRoute,
    private route: Router
  ) {}

  ngOnInit(): void {
    this.activateRouter.paramMap.subscribe((data) => {
      let id: any = data.get('id');
      this.id = id;
      if (id)
        this.Iservice.getItemsById(id).subscribe((data) => {
          this.Item = data;
          console.log(this.Item);
        });
    });
  }

  addtoCart() {
    this.Oservice.addHistory(this.Item.itemId).subscribe((data) => {
      alert('Add Success !!!');
      this.route.navigateByUrl('/orderDetail');
    });
  }

  editInformation() {
    const dilogRef = this.dialog;
    dilogRef.open(AddEditComponent, { data: this.Item });
    dilogRef.afterAllClosed.subscribe((data) => {
      this.Iservice.getItemsById(this.id).subscribe((data) => {
        this.Item = data;
      });
    });
  }
}
