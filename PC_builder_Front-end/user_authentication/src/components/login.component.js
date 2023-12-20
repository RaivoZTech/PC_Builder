import React, { Component } from 'react';
import axios from 'axios';
import { Navigate } from 'react-router-dom';

class Login extends Component {
  state = {
    usernameOrEmail: '',
    password: '',
    errorMessage: '', // State to hold the error message
    isLoggedIn: false, // State to track if the user is logged in
    loginSuccessMessage: '', // State to hold the success message
  };

  handleChange = (e) => {
    this.setState({ [e.target.name]: e.target.value });
  };

  handleSubmit = async (e) => {
    e.preventDefault();
    this.setState({ errorMessage: '', loginSuccessMessage: '' }); // Clear any existing messages
    try {
      const { usernameOrEmail, password } = this.state;
      const response = await axios.post('http://localhost:8080/api/auth/signin', { usernameOrEmail, password });
      console.log(response.data);

      // Check if login was successful
      if (response.status === 200) {
        // Set isLoggedIn to true to indicate that the user is logged in
        this.setState({ isLoggedIn: true });

        // Extract and set the success message from the backend response
        this.setState({ successMessage: `Welcome, ${response.data.username}!` });
      }

    } catch (error) {
      console.error('Login error', error.response);
      this.setState({ 
        errorMessage: 'Email or password is incorrect',
        // Reset form fields
        usernameOrEmail: '',
        password: ''
      });
    }
  };

  render() {
    // Check if the user is logged in, and if so, navigate to the home page
    if (this.state.isLoggedIn) {
      return <Navigate to="/homepage" />;
    }

    return (
      <div className="d-flex align-items-center justify-content-center min-vh-50">
      <div className="col-md-6 col-lg-4 mx-auto">
        <div className="bg-light rounded-4 py-5 px-4 px-md-5">
        <div className="custom-form-container">
        <form onSubmit={this.handleSubmit}>
          <h3>Sign In</h3>

          {/* Display success message */}
          {this.state.loginSuccessMessage && (
            <div className="alert alert-success" role="alert">
              {this.state.loginSuccessMessage}
            </div>
          )}

          {/* Display error message */}
          {this.state.errorMessage && (
            <div className="alert alert-danger" role="alert">
              {this.state.errorMessage}
            </div>
          )}

          <div className="mb-3">
            <label>Username or Email</label>
            <input
              type="text"
              className="form-control"
              placeholder="Enter username or Email"
              name="usernameOrEmail"
              value={this.state.usernameOrEmail}
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
              Submit
            </button>
          </div>
        </form>
        </div>
        </div>
        </div>
      </div>
    );
  }
}

export default Login;
