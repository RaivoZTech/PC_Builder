import React, { Component } from 'react';
import axios from 'axios';
import NavBarMain from '../components/NavBarMain';
import Footer from '../components/Footer';

class Builder extends Component {
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
                ssd: []
            },
            selectedComponents: {
                case: '',
                motherboard: '',
                cpu: '',
                ram: '',
                gpu: '',
                psu: '',
                ssd: ''
            },
            recentlyAdded: {
                case: false,
                motherboard: false,
                cpu: false,
                ram: false,
                gpu: false,
                psu: false,
                ssd: false
            },
            addedComponents: [],
            showAlert: false,
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
    
    addToBuild = (componentType) => {
        const componentId = Number(this.state.selectedComponents[componentType]);
        if (componentId) {
            const component = this.state.components[componentType].find(c => c.id === componentId);
            if (component) {
                this.setState(prevState => ({
                    addedComponents: [...prevState.addedComponents, component],
                    recentlyAdded: {
                        ...prevState.recentlyAdded,
                        [componentType]: true }
                }), () => {
                    setTimeout(() => {
                        this.setState(prevState => ({
                            recentlyAdded: {
                                ...prevState.recentlyAdded,
                                [componentType]: false
                            }
                        }));
                    }, 2000); // Clears the flag after 1 second
                });
            }
        };
    }

    renderDropdown(componentType, label) {
        const isRecentlyAdded = this.state.recentlyAdded[componentType];
        const messageClass = isRecentlyAdded ? "added-message-container added-message-active" : "added-message-container";
        return (
            <div className="mb-3">
                <label htmlFor={componentType} className="form-label">{label}</label>
                <div className="input-group">
                    <select
                        className="form-select"
                        id={componentType}
                        value={this.state.selectedComponents[componentType]}
                        onChange={(e) => this.handleSelectChange(componentType, e.target.value)}
                    >
                        <option value="">Select a {label}</option>
                        {this.state.components[componentType].map((component, index) => (
                            <option key={index} value={component.id}>{component.name} - {component.specs} </option>
                        ))}
                    </select>
                    <button 
                    type="button" 
                    className="btn btn-outline-primary" 
                    onClick={() => this.addToBuild(componentType)}
                >
                    Add to Build
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
                        <div className="alert alert-info mt-2">
                            <div>{selectedComponent.name} - {selectedComponent.specs}</div>
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
        this.setState(prevState => ({
            addedComponents: prevState.addedComponents.filter(c => c.id !== selectedComponentId),
            selectedComponents: {
                ...prevState.selectedComponents,
                [componentType]: ''
            }
        }));
    }
    

    render() {
        return (
            <div>
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
                                        <form>
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
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </main>
                <Footer />
            </div>
        );
    }
}

export default Builder;

