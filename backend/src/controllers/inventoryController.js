const InventoryItem = require('../models/InventoryItem');

exports.getInventoryItems = async (req, res) => {
    try {
        const inventoryItems = await InventoryItem.find().sort({ name: 1 });
        res.json(inventoryItems);
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
};

exports.addInventoryItem = async (req, res) => {
    try {
        const { name, quantity, price, expirationDate } = req.body;
        const newItem = new InventoryItem({ name, quantity, price, expirationDate });
        const savedItem = await newItem.save();
        res.status(201).json(savedItem);
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
};

exports.updateInventoryItem = async (req, res) => {
    try {
        const { name, quantity, price, expirationDate } = req.body;
        const updatedItem = await InventoryItem.findByIdAndUpdate(
            req.params.id,
            { name, quantity, price, expirationDate },
            { new: true }
        );
        if (!updatedItem) {
            return res.status(404).json({ message: 'Inventory item not found' });
        }
        res.json(updatedItem);
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
};

exports.deleteInventoryItem = async (req, res) => {
    try {
        const deletedItem = await InventoryItem.findByIdAndDelete(req.params.id);
        if (!deletedItem) {
            return res.status(404).json({ message: 'Inventory item not found' });
        }
        res.json({ message: 'Inventory item deleted' });
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
};
