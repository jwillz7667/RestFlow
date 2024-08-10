const Setting = require('../models/Setting');

exports.getSettings = async (req, res) => {
    try {
        const settings = await Setting.find();
        const settingsObject = settings.reduce((acc, setting) => {
            acc[setting.key] = setting.value;
            return acc;
        }, {});
        res.json(settingsObject);
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
};

exports.updateSetting = async (req, res) => {
    try {
        const { key, value } = req.body;
        let setting = await Setting.findOne({ key });
        if (setting) {
            setting.value = value;
            await setting.save();
        } else {
            setting = new Setting({ key, value });
            await setting.save();
        }
        res.json(setting);
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
};

exports.deleteSetting = async (req, res) => {
    try {
        const { key } = req.params;
        const deletedSetting = await Setting.findOneAndDelete({ key });
        if (!deletedSetting) {
            return res.status(404).json({ message: 'Setting not found' });
        }
        res.json({ message: 'Setting deleted' });
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
};
