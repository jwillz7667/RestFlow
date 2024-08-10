const Employee = require('../models/Employee');

class EmployeeService {
  async getEmployees() {
    return await Employee.find().sort({ name: 1 });
  }

  async addEmployee(employeeData) {
    const newEmployee = new Employee(employeeData);
    return await newEmployee.save();
  }

  async updateEmployee(employeeId, employeeData) {
    return await Employee.findByIdAndUpdate(
      employeeId,
      employeeData,
      { new: true }
    );
  }

  async deleteEmployee(employeeId) {
    return await Employee.findByIdAndDelete(employeeId);
  }

  async getEmployeeById(employeeId) {
    return await Employee.findById(employeeId);
  }
}

module.exports = new EmployeeService();
