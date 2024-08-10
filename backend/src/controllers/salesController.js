const Sale = require('../models/Sale');
const Expense = require('../models/Expense');

exports.getSales = async (req, res) => {
    try {
        const { startDate, endDate } = req.query;
        const query = {};
        if (startDate && endDate) {
            query.date = { $gte: new Date(startDate), $lte: new Date(endDate) };
        }
        const sales = await Sale.find(query).sort({ date: -1 });
        res.json(sales);
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
};

exports.addSale = async (req, res) => {
    try {
        const { orderId, total, date } = req.body;
        const newSale = new Sale({ orderId, total, date });
        const savedSale = await newSale.save();
        res.status(201).json(savedSale);
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
};

exports.getExpenses = async (req, res) => {
    try {
        const { startDate, endDate } = req.query;
        const query = {};
        if (startDate && endDate) {
            query.date = { $gte: new Date(startDate), $lte: new Date(endDate) };
        }
        const expenses = await Expense.find(query).sort({ date: -1 });
        res.json(expenses);
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
};

exports.addExpense = async (req, res) => {
    try {
        const { description, amount, date, category } = req.body;
        const newExpense = new Expense({ description, amount, date, category });
        const savedExpense = await newExpense.save();
        res.status(201).json(savedExpense);
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
};
