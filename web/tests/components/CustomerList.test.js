import React from 'react';
import { render, screen } from '@testing-library/react';
import CustomerList from '../../components/CRM/CustomerList';

describe('CustomerList', () => {
  const mockCustomers = [
    { id: 1, name: 'John Doe', email: 'john@example.com' },
    { id: 2, name: 'Jane Smith', email: 'jane@example.com' },
  ];

  it('renders customer list correctly', () => {
    render(<CustomerList customers={mockCustomers} />);
    
    mockCustomers.forEach(customer => {
      expect(screen.getByText(`${customer.name} - ${customer.email}`)).toBeInTheDocument();
    });
  });
});
