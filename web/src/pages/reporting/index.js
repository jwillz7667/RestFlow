import React from 'react';
import ReportGenerator from '../../components/Reporting/ReportGenerator';

const ReportingPage = () => {
  const handleGenerateReport = (reportType, startDate, endDate) => {
    // TODO: Implement report generation logic
    console.log('Generating report:', reportType, startDate, endDate);
  };

  return (
    <div>
      <h1>Reporting and Analytics</h1>
      <ReportGenerator onGenerateReport={handleGenerateReport} />
    </div>
  );
};

export default ReportingPage;
