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

## Project Structure

The project is divided into three main components:

1. `/backend`: Node.js backend server
2. `/ios`: iOS client application
3. `/web`: Web-based admin dashboard

## Getting Started

### Prerequisites

- Node.js (v14 or later)
- MongoDB
- iOS development environment (Xcode, CocoaPods)
- Web development environment (Node.js, npm)

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/yourusername/restflow.git
   ```

2. Set up the backend:
   ```
   cd backend
   npm install
   cp .env.example .env
   # Edit .env with your configuration
   npm run dev
   ```

3. Set up the iOS app:
   ```
   cd ../ios
   pod install
   # Open the .xcworkspace file in Xcode and run the app
   ```

4. Set up the web dashboard:
   ```
   cd ../web
   npm install
   npm run dev
   ```

## Running Tests

- Backend tests: `cd backend && npm test`
- iOS tests: Run tests through Xcode
- Web tests: `cd web && npm test`

## Deployment

- Backend: See `backend/scripts/deploy.sh`
- iOS: Follow standard App Store submission process
- Web: Deploy to your preferred hosting service (e.g., Vercel, Netlify)

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
