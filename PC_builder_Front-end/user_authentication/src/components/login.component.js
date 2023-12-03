import React, { Component } from 'react';
import axios from 'axios';

export default class Login extends Component {
  state = {
    usernameOrEmail: '',
    password: '',
    errorMessage: '', // State to hold the error message
  };

  handleChange = (e) => {
    this.setState({ [e.target.name]: e.target.value });
  };

  handleSubmit = async (e) => {
    e.preventDefault();
    this.setState({ errorMessage: '' }); // Clear any existing error message
    try {
      const { usernameOrEmail, password } = this.state;
      const response = await axios.post('http://localhost:8080/api/auth/signin', { usernameOrEmail, password });
      console.log(response.data);
      // Handle successful response / redirect
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
    return (
      <form onSubmit={this.handleSubmit}>
        <h3>Sign In</h3>

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
    );
  }
}
