import React from "react"
import { Link } from "react-router-dom";
function NavBarMain() {

    const username = localStorage.getItem('username') || 'User';


    return (
        <div>
            <nav className="navbar navbar-expand-lg navbar-light bg-white py-3">
            <div className="container px-5">
            <Link className="navbar-brand" to="/homepage">
            <span className="fw-bolder text-primary">PC Builder & Compatibility Checker</span>
          </Link>
                <div className="flex-grow-1 d-flex justify-content-center">
                    <span style={{ fontSize: 'small' }}><b className="text-gradient d-inline">Welcome, {username}!</b></span>
                </div>
                    <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span className="navbar-toggler-icon"></span></button>
                    <div className="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul className="navbar-nav ms-auto mb-2 mb-lg-0 small fw-bolder ">
                            <li className="nav-item"><a className="nav-link" href="homepage">Home</a></li>
                            <li className="nav-item"><a className="nav-link" href="technews">News</a></li>
                            <li className="nav-item"><a className="nav-link" href="projects">My Builds</a></li>
                            <li className="nav-item"><a className="nav-link" href="buildpc">Build PC</a></li>
                            <li className="nav-item"><a className="nav-link" href="/logout">Log out</a></li>
                        </ul>
                    </div>
                </div>
            </nav> </div>
    )
}

export default NavBarMain