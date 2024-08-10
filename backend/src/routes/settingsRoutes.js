const express = require('express');
const router = express.Router();
const settingsController = require('../controllers/settingsController');

router.get('/', settingsController.getSettings);
router.put('/', settingsController.updateSetting);
router.delete('/:key', settingsController.deleteSetting);

module.exports = router;
