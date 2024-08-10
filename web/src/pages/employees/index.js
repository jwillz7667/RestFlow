import React from 'react';
import EmployeeSchedule from '../../components/Employees/EmployeeSchedule';

const EmployeesPage = () => {
  // TODO: Fetch employee schedule data from API
  const schedule = [
    { id: 1, name: 'John Doe', shifts: ['9AM-5PM', '9AM-5PM', '9AM-5PM', '9AM-5PM', '9AM-5PM', 'Off', 'Off'] },
    { id: 2, name: 'Jane Smith', shifts: ['Off', '10AM-6PM', '10AM-6PM', '10AM-6PM', '10AM-6PM', '10AM-6PM', 'Off'] },
  ];

  return (
    <div>
      <h1>Employee Management</h1>
      <EmployeeSchedule schedule={schedule} />
    </div>
  );
};

export default EmployeesPage;
