const InventoryItem = require('../models/InventoryItem');

class InventoryService {
  async getInventoryItems() {
    return await InventoryItem.find().sort({ name: 1 });
  }

  async addInventoryItem(itemData) {
    const newItem = new InventoryItem(itemData);
    return await newItem.save();
  }

  async updateInventoryItem(itemId, itemData) {
    return await InventoryItem.findByIdAndUpdate(
      itemId,
      itemData,
      { new: true }
    );
  }

  async deleteInventoryItem(itemId) {
    return await InventoryItem.findByIdAndDelete(itemId);
  }

  async getLowStockItems(threshold) {
    return await InventoryItem.find({ quantity: { $lte: threshold } });
  }
}

module.exports = new InventoryService();
