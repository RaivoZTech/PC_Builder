import React, { Component } from 'react';
import axios from 'axios';

export default class SignUp extends Component {
  state = {
    name: '',
    username: '',
    email: '',
    password: ''
  };

  handleChange = (e) => {
    this.setState({ [e.target.name]: e.target.value });
  };

  handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const { name, username, email, password } = this.state;
      const response = await axios.post('http://localhost:8080/api/auth/signup', { name, username, email, password });
      console.log(response.data);
      // Handle response / redirect
    } catch (error) {
      console.error('Signup error', error.response);
      // Handle error
    }
  };

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <h3>Sign Up</h3>
        <div className="mb-3">
          <label>Name</label>
          <input
            type="text"
            className="form-control"
            placeholder="Name"
            name="name"
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