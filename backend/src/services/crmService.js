const Customer = require('../models/Customer');

class CRMService {
  async getCustomers() {
    return await Customer.find().sort({ name: 1 });
  }

  async addCustomer(customerData) {
    const newCustomer = new Customer(customerData);
    return await newCustomer.save();
  }

  async updateCustomer(customerId, customerData) {
    return await Customer.findByIdAndUpdate(
      customerId,
      customerData,
      { new: true }
    );
  }

  async deleteCustomer(customerId) {
    return await Customer.findByIdAndDelete(customerId);
  }

  async getCustomerById(customerId) {
    return await Customer.findById(customerId);
  }
}

module.exports = new CRMService();
