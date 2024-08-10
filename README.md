# RestFlow

RestFlow is a comprehensive SaaS restaurant management system inspired by Revel's POS system. It provides robust features for order management, menu customization, sales tracking, inventory control, and more.

## Features

- Order Management
- Menu Customization
- Sales and Expense Tracking
- Inventory Management
- Customer Relationship Management (CRM)
- Employee Scheduling and Time Tracking
- Reporting and Analytics
- User Authentication and Authorization

## Getting Started

### Prerequisites

- Node.js (v14 or later)
- MongoDB
- iOS development environment (Xcode, CocoaPods)

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/yourusername/restflow.git
   ```

2. Install backend dependencies:
   ```
   cd backend
   npm install
   ```

3. Set up environment variables:
   Create a `.env` file in the `backend` directory and add the following:
   ```
   NODE_ENV=development
   PORT=5000
   MONGO_URI=your_mongodb_connection_string
   JWT_SECRET=your_jwt_secret
   ```

4. Start the backend server:
   ```
   npm run dev
   ```

5. Install iOS dependencies:
   ```
   cd ../ios
   pod install
   ```

6. Open the iOS project in Xcode and run the app on a simulator or device.

## Running Tests

To run backend tests:
```
cd backend
npm test
```

To run iOS tests, use Xcode's test navigator.

## Deployment

For backend deployment instructions, see `backend/scripts/deploy.sh`.

For iOS app deployment, follow standard App Store submission guidelines.

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
