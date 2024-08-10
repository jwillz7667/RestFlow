const express = require('express');
const router = express.Router();
const menuController = require('../controllers/menuController');

router.post('/items', menuController.createMenuItem);
router.get('/items', menuController.getMenuItems);
router.put('/items/:id', menuController.updateMenuItem);
router.delete('/items/:id', menuController.deleteMenuItem);

router.post('/categories', menuController.createCategory);
router.get('/categories', menuController.getCategories);

module.exports = router;
