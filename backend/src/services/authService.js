const User = require('../models/User');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

class AuthService {
  async registerUser(userData) {
    const { name, email, password } = userData;
    
    // Check if user already exists
    let user = await User.findOne({ email });
    if (user) {
      throw new Error('User already exists');
    }

    // Create new user
    user = new User({ name, email, password });

    // Hash password
    const salt = await bcrypt.genSalt(10);
    user.password = await bcrypt.hash(password, salt);

    await user.save();

    // Create and return JWT token
    const payload = {
      user: {
        id: user.id
      }
    };

    return jwt.sign(payload, process.env.JWT_SECRET, { expiresIn: '1h' });
  }

  async loginUser(email, password) {
    // Check if user exists
    const user = await User.findOne({ email });
    if (!user) {
      throw new Error('Invalid credentials');
    }

    // Check password
    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) {
      throw new Error('Invalid credentials');
    }

    // Create and return JWT token
    const payload = {
      user: {
        id: user.id
      }
    };

    return jwt.sign(payload, process.env.JWT_SECRET, { expiresIn: '1h' });
  }

  async getUserById(userId) {
    return User.findById(userId).select('-password');
  }
}

module.exports = new AuthService();
