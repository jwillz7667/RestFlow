import React from 'react';
import OrderList from '../../components/Orders/OrderList';

const OrdersPage = () => {
  // TODO: Fetch orders from API
  const orders = [
    { id: 1, status: 'Pending', total: 25.99 },
    { id: 2, status: 'Completed', total: 34.50 },
  ];

  return (
    <div>
      <h1>Orders</h1>
      <OrderList orders={orders} />
    </div>
  );
};

export default OrdersPage;
