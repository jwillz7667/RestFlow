const express = require('express');
const router = express.Router();
const reportingController = require('../controllers/reportingController');

router.get('/sales', reportingController.getSalesReport);
router.get('/expenses', reportingController.getExpenseReport);
router.get('/inventory', reportingController.getInventoryReport);
router.get('/employees', reportingController.getEmployeeReport);

module.exports = router;
