const Sale = require('../models/Sale');
const Expense = require('../models/Expense');

class SalesService {
  async getSales(startDate, endDate) {
    const query = {};
    if (startDate && endDate) {
      query.date = { $gte: new Date(startDate), $lte: new Date(endDate) };
    }
    return await Sale.find(query).sort({ date: -1 });
  }

  async addSale(saleData) {
    const newSale = new Sale(saleData);
    return await newSale.save();
  }

  async getExpenses(startDate, endDate) {
    const query = {};
    if (startDate && endDate) {
      query.date = { $gte: new Date(startDate), $lte: new Date(endDate) };
    }
    return await Expense.find(query).sort({ date: -1 });
  }

  async addExpense(expenseData) {
    const newExpense = new Expense(expenseData);
    return await newExpense.save();
  }
}

module.exports = new SalesService();
