const express = require('express');
const router = express.Router();
const salesController = require('../controllers/salesController');

router.get('/', salesController.getSales);
router.post('/', salesController.addSale);
router.get('/expenses', salesController.getExpenses);
router.post('/expenses', salesController.addExpense);

module.exports = router;
