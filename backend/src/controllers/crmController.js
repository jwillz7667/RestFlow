const Customer = require('../models/Customer');

exports.getCustomers = async (req, res) => {
    try {
        const customers = await Customer.find().sort({ name: 1 });
        res.json(customers);
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
};

exports.addCustomer = async (req, res) => {
    try {
        const { name, email, phone } = req.body;
        const newCustomer = new Customer({ name, email, phone });
        const savedCustomer = await newCustomer.save();
        res.status(201).json(savedCustomer);
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
};

exports.updateCustomer = async (req, res) => {
    try {
        const { name, email, phone } = req.body;
        const updatedCustomer = await Customer.findByIdAndUpdate(
            req.params.id,
            { name, email, phone },
            { new: true }
        );
        if (!updatedCustomer) {
            return res.status(404).json({ message: 'Customer not found' });
        }
        res.json(updatedCustomer);
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
};

exports.deleteCustomer = async (req, res) => {
    try {
        const deletedCustomer = await Customer.findByIdAndDelete(req.params.id);
        if (!deletedCustomer) {
            return res.status(404).json({ message: 'Customer not found' });
        }
        res.json({ message: 'Customer deleted' });
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
};
