import { idgroup } from './idgroup';
import { item } from './item';
import { order } from './order';

export interface orderdetail {
  id: idgroup;
  item: item;
  order: order;
  quantity: number;
}
