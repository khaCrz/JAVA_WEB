import { Component, Inject } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { ItemService } from '../services/item.service';
import { CategoryService } from '../services/category.service';
import { TypeService } from '../services/type.service';
import { category } from '../models/category';
import { type } from '../models/type';
import { item } from '../models/item';

@Component({
  selector: 'app-add-edit',
  templateUrl: './add-edit.component.html',
  styleUrls: ['./add-edit.component.css'],
})
export class AddEditComponent {
  sfForm: FormGroup;
  cates!: category[];
  types!: type[];

  ADD: boolean = false;
  EDIT: boolean = true;
  addOrEdit = this.ADD;

  constructor(
    private itemService: ItemService,
    private cateService: CategoryService,
    private typeService: TypeService,
    private fb: FormBuilder,
    private dialog: MatDialogRef<AddEditComponent>,
    @Inject(MAT_DIALOG_DATA) private data: any
  ) {
    this.sfForm = fb.group({
      item_id: [''],
      item_name: [''],
      color: [''],
      size: [''],
      price: [''],
      imageUrl: [''],
      discount_price: [''],
      category_item: [''],
      type_item: [''],
    });
  }

  compareFn(c1: any, c2: any): boolean {
    console.log(c1 && c2 ? c1.id === c2.id : c1 === c2);
    return c1 && c2 ? c1.id === c2.id : c1 === c2;
  }

  ngOnInit(): void {
    this.cateService.getCategorys().subscribe(data => {
      this.cates = data;
    });
    this.typeService.getTypes().subscribe(data => {
      this.types = data;

    });

    if (this.data != null) {
      this.sfForm.patchValue(this.data);
      this.addOrEdit = this.EDIT;
    } else {
      this.addOrEdit = this.ADD;
    }
  }

  onSubmit() {
    if (true) {
      let e: item = this.sfForm.value;
      console.log(e);
      if (this.addOrEdit == this.ADD) {
        this.itemService.addItem(e).subscribe((data) => {
          this.dialog.close(true);
        });
      } else {
        this.itemService.editItem(e).subscribe((data) => {
          this.dialog.close(true);
        });
      }
    }
  }
}
