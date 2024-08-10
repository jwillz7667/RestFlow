import React from 'react';
import SystemSettings from '../../components/Settings/SystemSettings';

const SettingsPage = () => {
  const initialSettings = {
    taxRate: 8.5,
    currency: 'USD',
    timeZone: 'America/New_York',
  };

  const handleSaveSettings = (settings) => {
    // TODO: Implement settings update logic
    console.log('Saving settings:', settings);
  };

  return (
    <div>
      <h1>System Settings</h1>
      <SystemSettings initialSettings={initialSettings} onSave={handleSaveSettings} />
    </div>
  );
};

export default SettingsPage;
