import React from 'react';
import LoginForm from '../../components/Authentication/LoginForm';

const LoginPage = () => {
  const handleLogin = (email, password) => {
    // TODO: Implement login logic
    console.log('Login attempt:', email, password);
  };

  return (
    <div>
      <h1>Login</h1>
      <LoginForm onLogin={handleLogin} />
    </div>
  );
};

export default LoginPage;
