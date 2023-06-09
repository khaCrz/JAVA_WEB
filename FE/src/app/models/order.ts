import { item } from './item';

export interface order {
  orderId: number;
  description: string;
  timeOrder: string;
  timeDelivery: string;
  totalPayment: number;
  status: number;
  phone: string;
  namReceiver: string;
  addressReciver: string;
  mail: string;
}
