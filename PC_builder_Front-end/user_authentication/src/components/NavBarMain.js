import React from "react"
function NavBarMain(){
return(
    <div>
        
    <nav className="navbar navbar-expand-lg navbar-light bg-white py-3">
                <div className="container px-5">
                    <a className="navbar-brand" href="homepage"><span className="fw-bolder text-primary">PC Builder & Compatibility Checker</span></a>
                    <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span className="navbar-toggler-icon"></span></button>
                    <div className="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul className="navbar-nav ms-auto mb-2 mb-lg-0 small fw-bolder ">
                            <li className="nav-item"><a className="nav-link" href="homepage">Home</a></li>
                            <li className="nav-item"><a className="nav-link" href="resume">News</a></li>
                            <li className="nav-item"><a className="nav-link" href="projects">My Builds</a></li>
                            <li className="nav-item"><a className="nav-link" href="builder">Build PC</a></li>
                        </ul>
                    </div>
                </div>
            </nav> </div>
    )
}

export default NavBarMain