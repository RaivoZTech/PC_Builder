import React, { Component } from 'react';
import axios from 'axios';

export default class Login extends Component {
  state = {
    usernameOrEmail: '',
    password: ''
  };

  handleChange = (e) => {
    this.setState({ [e.target.name]: e.target.value });
  };

  handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const { usernameOrEmail, password } = this.state;
      const response = await axios.post('http://localhost:8080/api/auth/signin', { usernameOrEmail, password });
      console.log(response.data);
      // Handle response / redirect
    } catch (error) {
      console.error('Login error', error.response);
      // Handle error
    }
  };

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <h3>Sign In</h3>
        <div className="mb-3">
          <label>Username or Email</label>
          <input
            type="text"
            className="form-control"
            placeholder="Enter username or Email"
            name="usernameOrEmail"
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
            Submit
          </button>
        </div>
      </form>
    )
  }
}
