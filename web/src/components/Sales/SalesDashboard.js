import React from 'react';

const SalesDashboard = ({ salesData }) => {
  return (
    <div>
      <h2>Sales Dashboard</h2>
      <div>
        <h3>Total Sales: ${salesData.totalSales}</h3>
        <h3>Average Order Value: ${salesData.averageOrderValue}</h3>
        <h3>Number of Orders: {salesData.numberOfOrders}</h3>
      </div>
    </div>
  );
};

export default SalesDashboard;
