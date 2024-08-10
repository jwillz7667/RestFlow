const MenuItem = require('../models/MenuItem');
const Category = require('../models/Category');

class MenuService {
  async createMenuItem(menuItemData) {
    const newMenuItem = new MenuItem(menuItemData);
    return await newMenuItem.save();
  }

  async getMenuItems() {
    return await MenuItem.find();
  }

  async updateMenuItem(menuItemId, menuItemData) {
    return await MenuItem.findByIdAndUpdate(
      menuItemId,
      menuItemData,
      { new: true }
    );
  }

  async deleteMenuItem(menuItemId) {
    return await MenuItem.findByIdAndDelete(menuItemId);
  }

  async createCategory(categoryData) {
    const newCategory = new Category(categoryData);
    return await newCategory.save();
  }

  async getCategories() {
    return await Category.find();
  }
}

module.exports = new MenuService();
