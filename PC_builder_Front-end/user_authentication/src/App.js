import React from 'react';
import '../node_modules/bootstrap/dist/css/bootstrap.min.css';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Login from './components/login.component';
import SignUp from './components/signup.component';
import HomePage from './pages/HomePage';
import Projects from './pages/projects';
import NavBarAuth from './components/NavBarAuth';
import Logout from './components/logout.componenet';
import TechNews from './pages/technews';
import BuildPC from './pages/buildPC';

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
          <Route path='/technews' element={<><TechNews/></>} />
          <Route path='/projects' element={<><Projects/></>} />
          <Route path='/buildPC' element={<><BuildPC/></>} />
          <Route path="/logout" element={<Logout />} />
        </Routes>
      </div>
    </Router>
  );
}

export default App;