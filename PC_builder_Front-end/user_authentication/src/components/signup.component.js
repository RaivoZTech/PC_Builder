import React, { Component } from 'react';
import axios from 'axios';
import { Navigate } from 'react-router-dom';

export default class SignUp extends Component {
  state = {
    name: '',
    username: '',
    email: '',
    password: '',
    errorMessage: '',
    redirectToLogin: false,
    showSignupModal: false // State for showing the modal
  };

  handleChange = (e) => {
    this.setState({ [e.target.name]: e.target.value });
  };

  handleSubmit = async (e) => {
    e.preventDefault();
    this.setState({ errorMessage: '' }); // Clear any existing error message
    try {
      const { name, username, email, password } = this.state;
      await axios.post('http://localhost:8080/api/auth/signup', { name, username, email, password });
      // Trigger the modal display
      this.setState({ showSignupModal: true });
      setTimeout(() => {
        this.setState({ redirectToLogin: true });
      }, 3000); // Redirect to login after 3 seconds
    } catch (error) {
      console.error('Signup error', error.response);
      this.setState({ 
        errorMessage: error.response?.data?.message || 'Username or email already exists.'
      });
    }
  };

  renderSignupModal() {
    if (!this.state.showSignupModal) {
      return null;
    }

    return (
      <div className="save-build-modal-backdrop">
        <div className="save-build-modal-content">
          <div className="modal-header">Registration Successful</div>
          <div className="modal-body">
            Your account has been created successfully. Redirecting to login page...
          </div>
        </div>
      </div>
    );
  }

  render() {
    // Redirect to login page when registration is successful
    if (this.state.redirectToLogin) {
      return <Navigate to="/sign-in" />;
    }
    return (
      <div className="d-flex align-items-center justify-content-center min-vh-50">
      <div className="col-md-6 col-lg-4 mx-auto">
        <div className="bg-light rounded-4 py-5 px-4 px-md-5">
        <div className="custom-form-container">
      <form onSubmit={this.handleSubmit}>
        <h3>Sign Up</h3>
         {/* Display error message */}
         {this.state.errorMessage && (
          <div className="alert alert-danger" role="alert">
            {this.state.errorMessage}
          </div>
        )}
        <div className="mb-3">
          <label>Name</label>
          <input
            type="text"
            className="form-control"
            placeholder="Name"
            name="name"
            value={this.state.name}
            onChange={this.handleChange}
          />
        </div>
        <div className="mb-3">
          <label>Username</label>
          <input 
            type="text" 
            className="form-control" 
            placeholder="Username"
            name="username"
            value={this.state.username}
            onChange={this.handleChange} 
          />
        </div>
        <div className="mb-3">
          <label>Email address</label>
          <input
            type="email"
            className="form-control"
            placeholder="Enter email"
            name="email"
            value={this.state.email}
            onChange={this.handleChange}
          />
        </div>
        <div className="mb-3">
          <label>Password</label>
          <input
            type="password"
            className="form-control"
            placeholder="Enter password"
            name="password"
            value={this.state.password}
            onChange={this.handleChange}
          />
        </div>
        <div className="d-grid">
          <button type="submit" className="btn btn-primary">
            Sign Up
          </button>
        </div>
      </form>
      </div>
      </div>
      </div>
      {this.renderSignupModal()}
      </div>
    )
  }
}