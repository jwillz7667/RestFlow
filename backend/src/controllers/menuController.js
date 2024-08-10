const MenuItem = require('../models/MenuItem');
const Category = require('../models/Category');

exports.createMenuItem = async (req, res) => {
    try {
        const { name, description, price, categoryId } = req.body;

        const newMenuItem = new MenuItem({
            name,
            description,
            price,
            categoryId
        });

        const savedMenuItem = await newMenuItem.save();
        res.status(201).json(savedMenuItem);
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
};

exports.getMenuItems = async (req, res) => {
    try {
        const menuItems = await MenuItem.find();
        res.json(menuItems);
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
};

exports.updateMenuItem = async (req, res) => {
    try {
        const { name, description, price, categoryId } = req.body;
        const menuItem = await MenuItem.findByIdAndUpdate(
            req.params.id,
            { name, description, price, categoryId },
            { new: true }
        );
        if (!menuItem) {
            return res.status(404).json({ message: 'Menu item not found' });
        }
        res.json(menuItem);
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
};

exports.deleteMenuItem = async (req, res) => {
    try {
        const menuItem = await MenuItem.findByIdAndDelete(req.params.id);
        if (!menuItem) {
            return res.status(404).json({ message: 'Menu item not found' });
        }
        res.json({ message: 'Menu item deleted' });
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
};

exports.createCategory = async (req, res) => {
    try {
        const { name } = req.body;

        const newCategory = new Category({ name });
        const savedCategory = await newCategory.save();
        res.status(201).json(savedCategory);
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
};

exports.getCategories = async (req, res) => {
    try {
        const categories = await Category.find();
        res.json(categories);
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
};
