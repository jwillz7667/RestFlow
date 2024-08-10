const { expect } = require('chai');
const sinon = require('sinon');
const authService = require('../../src/services/authService');
const User = require('../../src/models/User');

describe('AuthService', () => {
  describe('registerUser', () => {
    it('should create a new user and return a token', async () => {
      const userData = {
        name: 'Test User',
        email: 'test@example.com',
        password: 'password123'
      };

      const userStub = sinon.stub(User, 'findOne').returns(null);
      const saveStub = sinon.stub(User.prototype, 'save').resolves({
        _id: '123',
        ...userData
      });

      const result = await authService.registerUser(userData);

      expect(result).to.be.a('string');
      expect(userStub.calledOnce).to.be.true;
      expect(saveStub.calledOnce).to.be.true;

      userStub.restore();
      saveStub.restore();
    });

    // Add more tests for error cases and edge scenarios
  });

  // Add tests for other AuthService methods
});
