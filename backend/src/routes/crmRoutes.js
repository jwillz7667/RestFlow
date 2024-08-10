const express = require('express');
const router = express.Router();
const crmController = require('../controllers/crmController');

router.get('/customers', crmController.getCustomers);
router.post('/customers', crmController.addCustomer);
router.put('/customers/:id', crmController.updateCustomer);
router.delete('/customers/:id', crmController.deleteCustomer);

module.exports = router;
