import React, { Component } from 'react';
import axios from 'axios';

export default class SignUp extends Component {
  state = {
    name: '',
    username: '',
    email: '',
    password: '',
    errorMessage: ''
  };

  handleChange = (e) => {
    this.setState({ [e.target.name]: e.target.value });
  };

  handleSubmit = async (e) => {
    e.preventDefault();
    this.setState({ errorMessage: '' }); // Clear any existing error message
    try {
      const { name, username, email, password } = this.state;
      const response = await axios.post('http://localhost:8080/api/auth/signup', { name, username, email, password });
      console.log(response.data);
      // Handle response / redirect
    } catch (error) {
      console.error('Signup error', error.response);
      this.setState({ 
        errorMessage: error.response?.data?.message || 'Username or email alredy exists.',
        // Reset form fields
        name: '',
        username: '',
        email: '',
        password: ''
      });
    }
  };

  render() {
    return (
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
            placeholder="Last name"
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
    )
  }
}