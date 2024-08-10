const Sale = require('../models/Sale');
const Expense = require('../models/Expense');
const InventoryItem = require('../models/InventoryItem');
const Employee = require('../models/Employee');

class ReportingService {
  async getSalesReport(startDate, endDate) {
    const query = {};
    if (startDate && endDate) {
      query.date = { $gte: new Date(startDate), $lte: new Date(endDate) };
    }
    const sales = await Sale.find(query);
    const totalSales = sales.reduce((sum, sale) => sum + sale.total, 0);
    const averageOrderValue = totalSales / sales.length || 0;
    return { totalSales, averageOrderValue, numberOfOrders: sales.length };
  }

  async getExpenseReport(startDate, endDate) {
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
    return { totalExpenses, expensesByCategory };
  }

  async getInventoryReport() {
    const inventoryItems = await InventoryItem.find();
    const totalInventoryValue = inventoryItems.reduce((sum, item) => sum + (item.price * item.quantity), 0);
    const lowStockItems = inventoryItems.filter(item => item.quantity < 10);
    return { totalInventoryValue, lowStockItems };
  }

  async getEmployeeReport() {
    const employees = await Employee.find();
    const employeeCount = employees.length;
    const positionBreakdown = employees.reduce((acc, employee) => {
      acc[employee.position] = (acc[employee.position] || 0) + 1;
      return acc;
    }, {});
    return { employeeCount, positionBreakdown };
  }
}

module.exports = new ReportingService();
