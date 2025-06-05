import React from 'react';
// import './AuthForm.css';

const AuthForm = ({ title, onSubmit, children }) => {
  return (
    <div className="auth-container">
      <h2>{title}</h2>
      <form onSubmit={onSubmit} className="auth-form">
        {children}
      </form>
    </div>
  );
};

export default AuthForm;