import { Component, OnInit, ViewChild } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatPaginator, MatPaginatorModule } from '@angular/material/paginator';
import { MatTableDataSource, MatTableModule } from '@angular/material/table';
import { MatSort, Sort } from '@angular/material/sort';
import { LiveAnnouncer } from '@angular/cdk/a11y';
import { FlatTreeControl } from '@angular/cdk/tree';
import {
  MatTreeFlatDataSource,
  MatTreeFlattener,
} from '@angular/material/tree';
import { item } from '../models/item';
import { ItemService } from '../services/item.service';
import { CategoryService } from '../services/category.service';
import { TypeService } from '../services/type.service';
import { category } from '../models/category';
import { type } from '../models/type';
import { AddEditComponent } from '../add-edit/add-edit.component';
import { Route, Router } from '@angular/router';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css'],
})
export class HomeComponent implements OnInit {
  items!: item[];
  cates!: category[];
  types!: type[];

  selectedCateOption: string = '0';
  selectedTypeOption: string = '0';

  constructor(
    private dialog: MatDialog,
    private itemService: ItemService,
    private cateService: CategoryService,
    private typeService: TypeService,
    private route: Router
  ) {}

  ngOnInit(): void {
    this.getsfList();
  }

  toggleAccordion(item: any) {
    item.open = !item.open;
  }

  onClickFilter() {
    let url =
      '/filter?cate=' +
      this.selectedCateOption +
      '&type=' +
      this.selectedTypeOption;
    this.itemService.getFilterItems(url).subscribe((data) => {
      this.items = data;
    });
  }

  openToAdd() {
    this.dialog.open(AddEditComponent);
  }

  onClickCard(id: number) {
    this.route.navigateByUrl('show' + '/' + id);
  }

  getsfList() {
    this.cateService.getCategorys().subscribe((data) => {
      console.log(data);
      this.cates = data;
    });
    this.typeService.getTypes().subscribe((data) => {
      this.types = data;
    });
    this.itemService.getItems().subscribe((data) => {
      this.items = data;
    });
  }
}
