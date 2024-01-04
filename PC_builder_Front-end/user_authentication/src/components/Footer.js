import React from "react";

function Footer(){
    return(
        <div>
            <footer className="bg-white py-4 mt-auto">
            <div className="container px-5">
            <div className="d-flex justify-content-center fs-2 gap-4">
                                <a className="text-gradient" href="https://www.linkedin.com/in/raivo-zelcs92/"><i className="bi bi-linkedin"></i></a>
                                <a className="text-gradient" href="https://www.facebook.com/raivo.zelcs.96!"><i className="bi bi-facebook"></i></a>
                                <a className="text-gradient" href="https://github.com/RaivoZTech"><i className="bi bi-github"></i></a>
                            </div>
                <div className="row align-items-center justify-content-between flex-column flex-sm-row">
                    <div className="col-auto"><div className="small m-0">Copyright &copy; PC@Comp 2023</div></div>
                    <div className="col-auto">
                        <a className="small" href="#!">Privacy</a>
                        <span className="mx-1">&middot;</span>
                        <a className="small" href="#!">Terms</a>
                        <span className="mx-1">&middot;</span>
                        <a className="small" href="#!">Contact</a>
                    </div>
                </div>
            </div>
        </footer>

        </div>
    )
}

export default Footer