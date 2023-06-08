import { category } from "./category";
import { type } from "./type";

export interface item {
  item_id: number;
  item_name: string;
  color: string;
  size: string;
  price: number;
  imageUrl: string;
  discount_price: number;
  category_item: category;
  type_item: type;

}
