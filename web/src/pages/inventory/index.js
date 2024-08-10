import React from 'react';
import InventoryList from '../../components/Inventory/InventoryList';

const InventoryPage = () => {
  // TODO: Fetch inventory data from API
  const inventory = [
    { id: 1, name: 'Item 1', quantity: 100, unitPrice: 5.99 },
    { id: 2, name: 'Item 2', quantity: 50, unitPrice: 9.99 },
  ];

  return (
    <div>
      <h1>Inventory Management</h1>
      <InventoryList inventory={inventory} />
    </div>
  );
};

export default InventoryPage;
