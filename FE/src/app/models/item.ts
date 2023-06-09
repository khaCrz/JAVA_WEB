import { category } from './category';
import { type } from './type';

export interface item {
  itemId: number;
  itemName: string;
  color: string;
  size: string;
  price: number;
  imageUrl: string;
  discountPrice: number;
  categoryItem: category;
  typeItem: type;
}
