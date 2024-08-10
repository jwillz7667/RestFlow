import React, { useState } from 'react';

const SystemSettings = ({ initialSettings, onSave }) => {
  const [settings, setSettings] = useState(initialSettings);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setSettings((prevSettings) => ({
      ...prevSettings,
      [name]: value,
    }));
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    onSave(settings);
  };

  return (
    <form onSubmit={handleSubmit}>
      <h2>System Settings</h2>
      <div>
        <label htmlFor="taxRate">Tax Rate (%)</label>
        <input
          type="number"
          id="taxRate"
          name="taxRate"
          value={settings.taxRate}
          onChange={handleChange}
          step="0.01"
          required
        />
      </div>
      <div>
        <label htmlFor="currency">Currency</label>
        <input
          type="text"
          id="currency"
          name="currency"
          value={settings.currency}
          onChange={handleChange}
          required
        />
      </div>
      <div>
        <label htmlFor="timeZone">Time Zone</label>
        <input
          type="text"
          id="timeZone"
          name="timeZone"
          value={settings.timeZone}
          onChange={handleChange}
          required
        />
      </div>
      <button type="submit">Save Settings</button>
    </form>
  );
};

export default SystemSettings;
