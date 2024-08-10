import React from 'react';
import CustomerList from '../../components/CRM/CustomerList';

const CRMPage = () => {
  // TODO: Fetch customer data from API
  const customers = [
    { id: 1, name: 'John Doe', email: 'john@example.com' },
    { id: 2, name: 'Jane Smith', email: 'jane@example.com' },
  ];

  return (
    <div>
      <h1>Customer Relationship Management</h1>
      <CustomerList customers={customers} />
    </div>
  );
};

export default CRMPage;
