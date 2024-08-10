import React from 'react';
import SalesDashboard from '../../components/Sales/SalesDashboard';

const SalesPage = () => {
  // TODO: Fetch sales data from API
  const salesData = {
    totalSales: 5000,
    averageOrderValue: 25,
    numberOfOrders: 200,
  };

  return (
    <div>
      <h1>Sales Dashboard</h1>
      <SalesDashboard salesData={salesData} />
    </div>
  );
};

export default SalesPage;
