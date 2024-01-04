import React, { Component } from 'react';
import axios from 'axios';
import NavBarMain from '../components/NavBarMain';
import Footer from '../components/Footer';

class BuildPC extends Component {
    constructor(props) {
        super(props);
        this.state = {
            components: {
                case: [],
                motherboard: [],
                cpu: [],
                ram: [],
                gpu: [],
                psu: [],
                ssd: [],
                cooler:[]
            },
            selectedComponents: {
                case: '',
                motherboard: '',
                cpu: '',
                ram: '',
                gpu: '',
                psu: '',
                ssd: '',
                cooler: ''
            },
            recentlyAdded: {
                case: false,
                motherboard: false,
                cpu: false,
                ram: false,
                gpu: false,
                psu: false,
                ssd: false,
                cooler: false
            },
            addedComponents: [],
            showModal: false  
        };
    }

    componentDidMount() {
        // Fetch initial data for all component types
        this.fetchComponentsByType('case');
        this.fetchComponentsByType('motherboard');
        this.fetchComponentsByType('cpu');
        this.fetchComponentsByType('ram');
        this.fetchComponentsByType('gpu');
        this.fetchComponentsByType('psu');
        this.fetchComponentsByType('ssd');
        this.fetchComponentsByType('cooler');
        
    }

    fetchComponentsByType = (componentType) => {
        axios.get(`http://localhost:8080/api/components/type/${componentType}`)
            .then((response) => {
                const componentsOfType = response.data;
                this.setState(prevState => ({
                    components: {
                        ...prevState.components,
                        [componentType]: componentsOfType
                    }
                }));
            })
            .catch((error) => {
                console.error(error);
            });
    }

    handleSelectChange = (componentType, value) => {
        this.setState(prevState => ({
            selectedComponents: {
                ...prevState.selectedComponents,
                [componentType]: value
            }
        }));
    }
    
    addToBuild = async (componentType) => {
        const componentId = Number(this.state.selectedComponents[componentType]);
        if (componentId) {
            const component = this.state.components[componentType].find(c => c.id === componentId);
    
            // Temporarily add the new component to the build for compatibility check
            const updatedBuild = [...this.state.addedComponents, component];
    
            if (updatedBuild.length > 1) {
                // Prepare data for compatibility check
                const componentIdsForCheck = updatedBuild.map(c => c.id);
    
                try {
                    // Call backend compatibility check endpoint
                    console.log("Sending for compatibility check:", { componentIds: componentIdsForCheck });
                    const response = await axios.post(`http://localhost:8080/api/pcbuilds/check-compatibility`, { componentIds: componentIdsForCheck });
                    
                    const compatibilityResult = response.data;
                    console.log("Response data:", compatibilityResult);
    
                    if (compatibilityResult === "Compatible") {
                        // If compatible, update state with the new component
                        this.setState({
                            addedComponents: updatedBuild,
                            recentlyAdded: {
                                ...this.state.recentlyAdded,
                                [componentType]: true
                            }
                        }, () => {
                            setTimeout(() => {
                                this.setState(prevState => ({
                                    recentlyAdded: {
                                        ...prevState.recentlyAdded,
                                        [componentType]: false
                                    }
                                }));
                            }, 2000);
                        });
                    } else {
                        // If not compatible, display an error message
                        alert(`Incompatibility Issue: ${compatibilityResult}`);
                    }
                } catch (error) {
                    console.error('Error during compatibility check', error);
                    alert("Error occurred while checking compatibility.");
                }
            } else {
                // If there's only one component, just add it without compatibility check
                this.setState(prevState => ({
                    addedComponents: updatedBuild,
                    recentlyAdded: {
                        ...prevState.recentlyAdded,
                        [componentType]: true
                    }
                }), () => {
                    setTimeout(() => {
                        this.setState(prevState => ({
                            recentlyAdded: {
                                ...prevState.recentlyAdded,
                                [componentType]: false
                            }
                        }));
                    });
                });
            }
        }
    };
    

    renderDropdown(componentType, label) {
        const isRecentlyAdded = this.state.recentlyAdded[componentType];
        const messageClass = isRecentlyAdded ? "added-message-container added-message-active" : "added-message-container";
    
        return (
            <div className="mb-3">
                <b><label htmlFor={componentType} className="form-label">{label}</label></b>
                <div className="input-group">
                    <select
                        className="form-select"
                        id={componentType}
                        value={this.state.selectedComponents[componentType]}
                        onChange={(e) => this.handleSelectChange(componentType, e.target.value)}
                    >
                        <option value="">Select a {label}</option>
                        {this.state.components[componentType].map((component, index) => (
                            <option key={index} value={component.id}>
                                {component.name} - €{component.price.toFixed(2)}
                            </option>
                        ))}
                    </select>
                    <button 
                        type="button" 
                        className="btn btn-outline-primary" 
                        onClick={() => this.addToBuild(componentType)}
                    > Add to Build
                    </button>
                    <div className={messageClass}>
                        <i className="bi bi-check-circle"></i> Added
                    </div>
                </div>
            </div>
        );
    }
    
    renderSelectedComponent(componentType) {
        const selectedComponentId = Number(this.state.selectedComponents[componentType]);
        if (selectedComponentId) {
            // Check if the component is in the addedComponents array
            const isAdded = this.state.addedComponents.some(component => component.id === selectedComponentId);
            if (isAdded) {
                const selectedComponent = this.state.components[componentType].find(c => c.id === selectedComponentId);
                if (selectedComponent) {
                    return (
                        <div className="alert alert-info mt-2" >
                            <div><b>Name:</b> {selectedComponent.name}</div>
                            <div><b>Specifications:</b> {selectedComponent.specs}</div>
                            <div><b>Price:</b> {selectedComponent.price}</div>
                            <button 
                                className="btn btn-danger btn-sm" 
                                onClick={() => this.removeFromBuild(componentType)}
                            >
                                Remove
                            </button>
                        </div>
                    );
                }
            }
        }
        return null;
    }

    
    removeFromBuild = (componentType) => {
        const selectedComponentId = Number(this.state.selectedComponents[componentType]);
        if (selectedComponentId) {
            this.setState(prevState => ({
                // Remove the component from addedComponents array
                addedComponents: prevState.addedComponents.filter(c => c.id !== selectedComponentId),
                // Reset the selected component for this type
                selectedComponents: {
                    ...prevState.selectedComponents,
                    [componentType]: ''
                }
            }));
        }
    };
    
    saveBuild = async (e) => {
        e.preventDefault()
        const userId = localStorage.getItem("userId");
        const componentIds = this.state.addedComponents.map(component => component.id);
    
        try {
            await axios.post('http://localhost:8080/api/pcbuilds', { userId, componentIds });
            this.setState({ showModal: true });
        } catch (error) {
            console.error('Error saving build', error);
        }
    };

    renderModal() {
        if (this.state.showModal) {
            return (
                <div className="save-build-modal-backdrop">
                    <div className="save-build-modal-content">
                        <div className="modal-header">Build Saved Successfully!</div>
                        <div className="modal-body">
                            Your custom PC build has been saved.
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
    
    calculateTotalPrice = () => {
        return this.state.addedComponents.reduce((total, component) => {
            return total + component.price;
        }, 0);
    };

    render() {
        const totalPrice = this.calculateTotalPrice();
        return (

            <div className='d-flex flex-column h-100'>
                <NavBarMain />
                <main className="flex-shrink-0">
                    <section className="py-5">
                        <div className="container px-5">
                            <div className="bg-light rounded-4 py-5 px-4 px-md-5">
                            <div className="text-center mb-5">
                                <h1 className="display-5 fw-bolder mb-0">
                                    <span className="text-gradient d-inline">Build your PC</span>
                                    </h1>
                                    </div>
                                <div className="row gx-5 justify-content-center">
                                    <div className="col-lg-8 col-xl-6">
                                        <form >
                                            {this.renderDropdown('case', 'Case')}
                                            {this.renderSelectedComponent('case')}
                                            {this.renderDropdown('motherboard', 'Motherboard')}
                                            {this.renderSelectedComponent('motherboard')}
                                            {this.renderDropdown('cpu', 'CPU')}
                                            {this.renderSelectedComponent('cpu')}
                                            {this.renderDropdown('ram', 'RAM')}
                                            {this.renderSelectedComponent('ram')}
                                            {this.renderDropdown('gpu', 'GPU')}
                                            {this.renderSelectedComponent('gpu')}
                                            {this.renderDropdown('psu', 'PSU')}
                                            {this.renderSelectedComponent('psu')}
                                            {this.renderDropdown('ssd', 'SSD')}
                                            {this.renderSelectedComponent('ssd')}
                                            {this.renderDropdown('cooler', 'Cooler')}
                                            {this.renderSelectedComponent('cooler')}
                                            <div className="text-center mb-3">
                                                    <h3>Total average price: €{totalPrice.toFixed(2)}</h3>
                                                </div>
                                                <button 
                                                    className="btn btn-success" 
                                                    onClick={this.saveBuild}
                                                >
                                                    Save Build
                                                </button>
                                            
                                        </form>
                                    </div>
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

export default BuildPC;

