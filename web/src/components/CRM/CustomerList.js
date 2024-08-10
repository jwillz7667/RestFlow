import React from 'react';

const CustomerList = ({ customers }) => {
  return (
    <ul>
      {customers.map((customer) => (
        <li key={customer.id}>
          {customer.name} - {customer.email}
        </li>
      ))}
    </ul>
  );
};

export default CustomerList;
