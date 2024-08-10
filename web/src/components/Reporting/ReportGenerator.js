import React, { useState } from 'react';

const ReportGenerator = ({ onGenerateReport }) => {
  const [reportType, setReportType] = useState('sales');
  const [startDate, setStartDate] = useState('');
  const [endDate, setEndDate] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();
    onGenerateReport(reportType, startDate, endDate);
  };

  return (
    <form onSubmit={handleSubmit}>
      <select value={reportType} onChange={(e) => setReportType(e.target.value)}>
        <option value="sales">Sales Report</option>
        <option value="inventory">Inventory Report</option>
        <option value="employees">Employee Report</option>
      </select>
      <input
        type="date"
        value={startDate}
        onChange={(e) => setStartDate(e.target.value)}
        required
      />
      <input
        type="date"
        value={endDate}
        onChange={(e) => setEndDate(e.target.value)}
        required
      />
      <button type="submit">Generate Report</button>
    </form>
  );
};

export default ReportGenerator;
