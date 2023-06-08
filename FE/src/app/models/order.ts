import { item } from "./item";

export interface order {
    order_id: number;
    quantity: number;
    item_id: number;
    item: item;

}
