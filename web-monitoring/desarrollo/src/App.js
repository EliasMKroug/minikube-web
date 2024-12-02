import React, { useState } from 'react';
import './App.css';

function App() {
  const [selectedUrl, setSelectedUrl] = useState("http://grafana.minikube.com/login"); // URL inicial

  return (
    <div className="app">
      {/* <h1>Bruno Monitoring</h1> */}
      <div className="d-flex flex-column align-items-center text-black text-center py-1">
        <div className="d-flex align-items-center justify-content-center">
          {/* Logo */}
          <img
            src="/apple-touch-icon.png" // Ruta de tu logo
            alt="Bruno Monitoring Logo"
            width="50"
            height="50"
            className="me-1"
          />
          <h1 className="display-7 fw-bold">Bruno Monitoring</h1> {/* Texto grande y negrita */}
        </div>
        <p className="lead fs-5 mt-0">La mejor solución para monitorear tus sistemas en tiempo real.</p>
      </div>

      {/* Navbar de Bootstrap */}
      <nav className="navbar navbar-default navbar-expand-lg navbar-secondary bg-light">
        <div className="container-fluid">
          <button
            className="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarNavDropdown"
            aria-controls="navbarNavDropdown"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span className="navbar-toggler-icon"></span>
          </button>
          <div className="collapse navbar-collapse" id="navbarNavDropdown">
            <ul className="navbar-nav">
              <li className="nav-item">
                <button
                  /* className="nav-link btn btn-link btn-secondary" */
                  className="btn btn-outline-secondary"
                  onClick={() => setSelectedUrl("http://grafana.minikube.com/login")}
                >
                  Grafana
                </button>
              </li>
              <li className="nav-item">
                <button
                  className="btn btn-outline-secondary"
                  onClick={() => setSelectedUrl("http://prometheus.minikube.com:9090/query")}
                >
                  Prometheus
                </button>
              </li>
            </ul>
          </div>
        </div>
      </nav>

      {/* Iframe para mostrar el contenido */}
      <iframe
        src={selectedUrl}
        frameBorder="0"
        title="Monitoring Dashboard"
      ></iframe>
    </div>
  );
}

export default App;
