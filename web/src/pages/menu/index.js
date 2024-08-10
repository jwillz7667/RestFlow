import React from 'react';
import MenuItemForm from '../../components/Menu/MenuItemForm';

const MenuPage = () => {
  const handleSubmit = (menuItem) => {
    // TODO: Implement menu item creation/update logic
    console.log('Menu item submitted:', menuItem);
  };

  return (
    <div>
      <h1>Menu Management</h1>
      <MenuItemForm onSubmit={handleSubmit} />
    </div>
  );
};

export default MenuPage;
