import React from 'react';

const InventoryList = ({ inventory }) => {
  return (
    <table>
      <thead>
        <tr>
          <th>Item</th>
          <th>Quantity</th>
          <th>Unit Price</th>
        </tr>
      </thead>
      <tbody>
        {inventory.map((item) => (
          <tr key={item.id}>
            <td>{item.name}</td>
            <td>{item.quantity}</td>
            <td>${item.unitPrice}</td>
          </tr>
        ))}
      </tbody>
    </table>
  );
};

export default InventoryList;
