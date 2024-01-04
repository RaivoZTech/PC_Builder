import React, { Component } from "react";
import axios from "axios";
import NavBarMain from "../components/NavBarMain";
import Footer from "../components/Footer";

class Projects extends Component {
    state = {
        builds: [],
        isLoading: true,
        error: null,
        imageUrls: {}, // State to track image URLs for each build
        showModal: false
    };

    componentDidMount() {
        this.fetchUserBuilds();
    }

    fetchUserBuilds = async () => {
        try {
            const userId = localStorage.getItem('userId');
            if (!userId) {
                throw new Error('User ID not found');
            }
    
            const response = await axios.get(`http://localhost:8080/api/pcbuilds/user/${userId}`);
            this.setState({ 
                builds: response.data, 
                isLoading: false,
                imageUrls: response.data.reduce((acc, build) => ({ ...acc, [build.id]: build.imageUrl || '' }), {}) // Initialize imageUrls state
            });
        } catch (error) {
            this.setState({ error: error, isLoading: false });
        }
    };

    calculateTotalPrice = (components) => {
        return components.reduce((total, component) => total + component.price, 0);
    };

    handleImageUrlChange = async (buildId, imageUrl) => {
        try {
            await axios.put(`http://localhost:8080/api/pcbuilds/${buildId}/image`, { imageUrl });
            this.fetchUserBuilds(); // Re-fetch builds to update the UI
        } catch (error) {
            console.error('Error updating image URL', error);
            // Handle error (e.g., show error message)
        }
    };

    handleImageUrlInputChange = (buildId, imageUrl) => {
        this.setState(prevState => ({
            imageUrls: {
                ...prevState.imageUrls,
                [buildId]: imageUrl
            }
        }));
    };

    handleDeleteBuild = async (buildId) => {
    try {
        await axios.delete(`http://localhost:8080/api/pcbuilds/${buildId}`);
        this.fetchUserBuilds(); // Re-fetch builds to update the UI
        this.setState({ showModal: true });
    } catch (error) {
        console.error('Error deleting build', error);
        // Handle error (e.g., show error message)
    }
};

    renderComponentList = (components) => {
        return components.map((component, index) => (
            <div key={index} className="mb-3">
                <h5 className="fw-bold">{component.type}</h5>
                <p className="small mb-0">Name: {component.name}</p>
                <p className="small">Specs: {component.specs}</p>
            </div>
        ));
    };
    
    renderModal() {
        if (this.state.showModal) {
            return (
                <div className="save-build-modal-backdrop">
                    <div className="save-build-modal-content">
                        <div className="modal-header">Build Deleted Successfully!</div>
                        <div className="modal-body">
                            Your custom PC build has been deleted.
                        </div>
                        <button 
                            onClick={() => this.setState({ showModal: false })}
                            className="modal-button"
                        >
                            Close
                        </button>
                    </div>
                </div>
            );
        }
        return null;
    }

    renderBuilds = () => {
        const { imageUrls } = this.state;
    
        return this.state.builds.map((build, index) => (
            <div className="card overflow-hidden shadow rounded-4 border-0 mb-5" key={build.id}>
                <div className="row g-0">
                    <div className="col-md-6 p-5">
                        <h2 className="fw-bolder">Build {index + 1}</h2>
                        {this.renderComponentList(build.components)}
                        <b><p>Total Price: €{this.calculateTotalPrice(build.components).toFixed(2)}</p></b>
                        <input 
                            type="text" 
                            className="form-control mb-2"
                            placeholder="Enter image URL"
                            value={imageUrls[build.id] || ""}
                            onChange={(e) => this.handleImageUrlInputChange(build.id, e.target.value)}
                        />
                        <button 
                            className="btn btn-primary"
                            onClick={() => this.handleImageUrlChange(build.id, imageUrls[build.id])}
                        >
                            Update Image
                        </button>
                        <button 
                        className="btn btn-danger ms-3" // Added ms-2 for margin on the start side
                        onClick={() => this.handleDeleteBuild(build.id)}
                    >
                        Delete Build
                    </button>
                    </div>
                    <div className="col-md-6 position-relative">
                        <img className="img-fluid rounded-end" src={build.imageUrl || "https://dummyimage.com/600x400/343a40/6c757d"} alt="Build" />
                        
                    </div>
                </div>
            </div>
        ));
    };
    

    render() {
        const { isLoading, error } = this.state;

        return (
            <div className="d-flex flex-column h-100 bg-light">
                <NavBarMain />
                <main className="flex-shrink-0">
                    <section className="py-5">
                        <div className="container px-5 mb-5">
                            <div className="text-center mb-5">
                                <h1 className="display-5 fw-bolder mb-0"><span className="text-gradient d-inline">My Builds</span></h1>
                            </div>
                            <div className="row gx-5 justify-content-center">
                                <div className="col-lg-11 col-xl-9 col-xxl-8">
                                    {isLoading ? <p>Loading builds...</p> : this.renderBuilds()}
                                    {error && <p className="text-danger">{error.message}</p>}
                                </div>
                            </div>
                        </div>
                    </section>
                </main>
                {this.renderModal()}
                <Footer />
            </div>
        );
    }
}

export default Projects;
