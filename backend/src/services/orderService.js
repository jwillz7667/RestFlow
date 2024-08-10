const Order = require('../models/Order');

class OrderService {
  async createOrder(orderData) {
    const newOrder = new Order(orderData);
    return await newOrder.save();
  }

  async getOrders() {
    return await Order.find().sort({ createdAt: -1 });
  }

  async getOrderById(orderId) {
    return await Order.findById(orderId);
  }

  async updateOrderStatus(orderId, status) {
    return await Order.findByIdAndUpdate(
      orderId,
      { status },
      { new: true }
    );
  }
}

module.exports = new OrderService();
