import React from 'react';

const EmployeeSchedule = ({ schedule }) => {
  return (
    <table>
      <thead>
        <tr>
          <th>Employee</th>
          <th>Monday</th>
          <th>Tuesday</th>
          <th>Wednesday</th>
          <th>Thursday</th>
          <th>Friday</th>
          <th>Saturday</th>
          <th>Sunday</th>
        </tr>
      </thead>
      <tbody>
        {schedule.map((employee) => (
          <tr key={employee.id}>
            <td>{employee.name}</td>
            {employee.shifts.map((shift, index) => (
              <td key={index}>{shift}</td>
            ))}
          </tr>
        ))}
      </tbody>
    </table>
  );
};

export default EmployeeSchedule;
