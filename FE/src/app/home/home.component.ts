import { Component, OnInit, ViewChild } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatPaginator, MatPaginatorModule } from '@angular/material/paginator';
import { MatTableDataSource, MatTableModule } from '@angular/material/table';
import { MatSort, Sort } from '@angular/material/sort';
import { LiveAnnouncer } from '@angular/cdk/a11y';
import { FlatTreeControl } from '@angular/cdk/tree';
import { MatTreeFlatDataSource, MatTreeFlattener } from '@angular/material/tree';
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
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
  items!: item[];
  cates!: category[];
  types!: type[];

  selectedCateOption: string = '0';
  selectedTypeOption: string = '0';

  accordionItems = [
    { title: 'Item 1', content: 'Content for item 1', open: false },
    { title: 'Item 2', content: 'Content for item 2', open: false },
    { title: 'Item 3', content: 'Content for item 3', open: false }
  ];

  constructor(
    private dialog: MatDialog,
    private _liveAnnouncer: LiveAnnouncer,
    private itemService: ItemService,
    private cateService: CategoryService,
    private typeService: TypeService,
    private route: Router
  ) { }

  ngOnInit(): void {
    this.getsfList();
  }

  toggleAccordion(item: any) {
    item.open = !item.open;
  }

  onClickFilter() {
    let url = "/filter?cate=" + this.selectedCateOption + "&type=" + this.selectedTypeOption;
    this.itemService.getFilterItems(url).subscribe(data => {
      this.items = data;
    });
  }

  openToAdd() {
    this.dialog.open(AddEditComponent);
  }

  onClickCard(id: number) {
    this.route.navigateByUrl("show" + "/" + id);
  }


  getsfList() {
    this.itemService.getItems().subscribe(data => {
      this.items = data;
    });
    this.cateService.getCategorys().subscribe(data => {
      this.cates = data;
    });
    this.typeService.getTypes().subscribe(data => {
      this.types = data;

    });
  }
}

