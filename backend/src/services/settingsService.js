const Setting = require('../models/Setting');

class SettingsService {
  async getSettings() {
    const settings = await Setting.find();
    return settings.reduce((acc, setting) => {
      acc[setting.key] = setting.value;
      return acc;
    }, {});
  }

  async updateSetting(key, value) {
    let setting = await Setting.findOne({ key });
    if (setting) {
      setting.value = value;
      return await setting.save();
    } else {
      setting = new Setting({ key, value });
      return await setting.save();
    }
  }

  async deleteSetting(key) {
    return await Setting.findOneAndDelete({ key });
  }
}

module.exports = new SettingsService();
