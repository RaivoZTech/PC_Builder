import React from "react";
import NavBarMain from "../components/NavBarMain";
import Footer from "../components/Footer";

function HomePage() {
  return (
    <div>
    <NavBarMain />
<div className="d-flex flex-column h-100">
    <main className="flex-shrink-0">
        {/* Header*/}
        <header className="py-5">
            <div className="container px-5 pb-5">
                <div className="row gx-5 align-items-center">
                    <div className="col-xxl-5">
                        {/* Header text content*/}
                        <div className="text-center text-xxl-start">
                            <div className="badge bg-gradient-primary-to-secondary text-white mb-4"><div className="text-uppercase">Design &middot; Build &middot; Creativity</div></div>
                            <div className="fs-3 fw-light text-muted">Welcome to PC Builder & compatibility checker</div>
                            <h1 className="display-3 fw-bolder mb-5"><span className="text-gradient d-inline">Let's start building your custom PC</span></h1>
                            <div className="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xxl-start mb-3">
                                <a className="btn btn-primary btn-lg px-5 py-3 me-sm-3 fs-6 fw-bolder" href="builder">Start Build</a>
                                <a className="btn btn-outline-dark btn-lg px-5 py-3 fs-6 fw-bolder" href="projects">View builds</a>
                            </div>
                        </div>
                    </div>
                    <div className="col-xxl-7">
                        {/* Header profile picture*/}
                        <div className="d-flex justify-content-center mt-5 mt-xxl-0">
                            <div className="profile bg-gradient-primary-to-secondary">
                                {/* TIP: For best results, use a photo with a transparent background like the demo example below*/}
                                {/* Watch a tutorial on how to do this on YouTube (link)*/}
                                <img className="profile-img" src="https://www.yugatech.com/wp-content/uploads/2021/03/pd-gundam.png" alt="..." />
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        {/* About Section*/}
        <section className="bg-light py-5">
            <div className="container px-5">
                <div className="row gx-5 justify-content-center">
                    <div className="col-xxl-8">
                        <div className="text-center my-5">
                            <h2 className="display-5 fw-bolder"><span className="text-gradient d-inline">About the Project</span></h2>
                                <p className="lead fw-light mb-4">Welcome to the PC Builder & Compatibility Checker.</p>
                                <p className="text-muted">This project is designed to simplify the process of building your
                                     own PC by providing a user-friendly interface to select and assemble components.
                                      Our tool ensures compatibility between selected parts, saving time and reducing the complexity often associated with building a custom PC.
                                       Whether you are a gaming enthusiast, a professional content creator, or just stepping into the world of custom-built PCs, our platform
                                        is tailored to meet your needs. Here, you can explore, create, and validate your dream PC build with confidence.</p>

                            <div className="d-flex justify-content-center fs-2 gap-4">
                                <a className="text-gradient" href="#!"><i className="bi bi-linkedin"></i></a>
                                <a className="text-gradient" href="#!"><i className="bi bi-facebook"></i></a>
                                <a className="text-gradient" href="#!"><i className="bi bi-github"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <Footer />
</div>
</div>
  );
}

export default HomePage;