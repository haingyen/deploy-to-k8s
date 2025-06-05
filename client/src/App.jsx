import React, { useState } from 'react';
import Login from './components/Login';
import Register from './components/Register';
import './App.css';

const App = () => {
  const [isLogin, setIsLogin] = useState(true);
  const [user, setUser] = useState(null);

  const handleLogin = (credentials) => {
    console.log('Đăng nhập với:', credentials);
    // Xử lý đăng nhập ở đây (thường là API call)
    setUser({ email: credentials.email });
  };

  const handleRegister = (userData) => {
    console.log('Đăng ký với:', userData);
    // Xử lý đăng ký ở đây (thường là API call)
    setUser({ email: userData.email });
    setIsLogin(true); // Chuyển sang trang đăng nhập sau khi đăng ký
  };

  const handleLogout = () => {
    setUser(null);
  };

  return (
    <div className="app">
      {user ? (
        <div className="welcome-container">
          <h1>Xin chào, {user.email}!</h1>
          <button onClick={handleLogout} className="auth-button">Đăng xuất</button>
        </div>
      ) : (
        <>
          {isLogin ? (
            <Login onLogin={handleLogin} />
          ) : (
            <Register onRegister={handleRegister} />
          )}
          <button 
            onClick={() => setIsLogin(!isLogin)} 
            className="switch-button"
          >
            {isLogin ? 'Chưa có tài khoản? Đăng ký' : 'Đã có tài khoản? Đăng nhập'}
          </button>
        </>
      )}
    </div>
  );
};

export default App;