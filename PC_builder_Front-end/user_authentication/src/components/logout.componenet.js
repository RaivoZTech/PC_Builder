import React, { Component } from 'react';
import { Navigate } from 'react-router-dom';

class Logout extends Component {
    constructor(props) {
        super(props);
        this.state = { navigate: false,
            showLogoutModal: false
        };
    }

    componentDidMount() {
        localStorage.removeItem('userId');
        this.setState({ showLogoutModal: true });
    
        // Navigate after a delay
        setTimeout(() => {
            this.setState({ navigate: true });
        }, 3000); // Delay for 3 seconds
    }


    renderLogoutModal() {
        if (!this.state.showLogoutModal) {
            return null;
        }
    
        return (
            <div className="save-build-modal-backdrop">
                <div className="save-build-modal-content">
                    <h4>Logged Out Successfully</h4>
                    <p>You have been logged out.</p>
                </div>
            </div>
        );
    }

    render() {
       
        if (this.state.navigate) {
            return <Navigate to="/sign-in" />;
        }

        return (
            <div>
                <p>Logging out...</p>
                {this.renderLogoutModal()}
            </div>
        );
    }
}

export default Logout;