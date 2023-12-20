import React from 'react';
import '../node_modules/bootstrap/dist/css/bootstrap.min.css';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Login from './components/login.component';
import SignUp from './components/signup.component';
import HomePage from './pages/HomePage';
import Resume from './pages/resume';
import Projects from './pages/projects';
import Builder from './pages/builder';
import NavBarAuth from './components/NavBarAuth';

function App() {
  return (
    <Router>
      <div className="App">
        <Routes>
          {/* Set the signin page as the initial landing page */}
          <Route path="/" element={<><NavBarAuth /><Login /></>} />
          <Route path="/sign-up" element={<><NavBarAuth /><SignUp /></>} />
          <Route path="/sign-in" element={<><NavBarAuth /><Login /></>} />
          <Route path='/homepage' element={<><HomePage /></>} />
          <Route path='/resume' element={<><Resume/></>} />
          <Route path='/projects' element={<><Projects/></>} />
          <Route path='/builder' element={<><Builder/></>} />
        </Routes>
      </div>
    </Router>
  );
}

export default App;