const Sale = require('../models/Sale');
const Expense = require('../models/Expense');
const InventoryItem = require('../models/InventoryItem');
const Employee = require('../models/Employee');

exports.getSalesReport = async (req, res) => {
    try {
        const { startDate, endDate } = req.query;
        const query = {};
        if (startDate && endDate) {
            query.date = { $gte: new Date(startDate), $lte: new Date(endDate) };
        }
        const sales = await Sale.find(query);
        const totalSales = sales.reduce((sum, sale) => sum + sale.total, 0);
        const averageOrderValue = totalSales / sales.length || 0;
        res.json({ totalSales, averageOrderValue, numberOfOrders: sales.length });
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
};

exports.getExpenseReport = async (req, res) => {
    try {
        const { startDate, endDate } = req.query;
        const query = {};
        if (startDate && endDate) {
            query.date = { $gte: new Date(startDate), $lte: new Date(endDate) };
        }
        const expenses = await Expense.find(query);
        const totalExpenses = expenses.reduce((sum, expense) => sum + expense.amount, 0);
        const expensesByCategory = expenses.reduce((acc, expense) => {
            acc[expense.category] = (acc[expense.category] || 0) + expense.amount;
            return acc;
        }, {});
        res.json({ totalExpenses, expensesByCategory });
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
};

exports.getInventoryReport = async (req, res) => {
    try {
        const inventoryItems = await InventoryItem.find();
        const totalInventoryValue = inventoryItems.reduce((sum, item) => sum + (item.price * item.quantity), 0);
        const lowStockItems = inventoryItems.filter(item => item.quantity < 10);
        res.json({ totalInventoryValue, lowStockItems });
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
};

exports.getEmployeeReport = async (req, res) => {
    try {
        const employees = await Employee.find();
        const employeeCount = employees.length;
        const positionBreakdown = employees.reduce((acc, employee) => {
            acc[employee.position] = (acc[employee.position] || 0) + 1;
            return acc;
        }, {});
        res.json({ employeeCount, positionBreakdown });
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
};
