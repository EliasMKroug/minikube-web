
import React, { useState, useEffect } from 'react';
import './App.css';

function App() {
  const [selectedUrl, setSelectedUrl] = useState("http://grafana.minikube.com/login");

  useEffect(() => {
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
    [...tooltipTriggerList].forEach(
      (tooltipTriggerEl) => new window.bootstrap.Tooltip(tooltipTriggerEl)
    );
  }, []);

  return (
    <div className="app">
      <div className="d-flex" style={{ height: '99vh' }}>
        {/* Navbar vertical */}
        <div className="d-flex flex-column flex-shrink-0 bg-body-tertiary" style={{ width: '4.5rem' }}>
          {/* Logo */}
          <a
            href="/"
            className="d-block p-3 link-body-emphasis text-decoration-none"
            data-bs-toggle="tooltip"
            data-bs-placement="right"
            title="Inicio"
          >
            <img
              src="/apple-touch-icon.png"
              alt="Bruno Monitoring Logo"
              width="40"
              height="40"
              className="rounded-circle"
            />
          </a>

          {/* Opciones del menú */}
          <ul className="nav nav-pills nav-flush flex-column mb-auto text-center">
            <li className="nav-item">
              <a
                href="#"
                className="nav-link active py-3 border-bottom rounded-0"
                aria-current="page"
                data-bs-toggle="tooltip"
                data-bs-placement="right"
                title="Grafana"
                onClick={() => setSelectedUrl("http://grafana.minikube.com/login")}
              >
                <img
                  src="/icons/grafana.svg"
                  alt="Grafana Icon"
                  width="24"
                  height="24"
                />
              </a>
            </li>
            <li>
              <a
                href="#"
                className="nav-link py-3 border-bottom rounded-0"
                data-bs-toggle="tooltip"
                data-bs-placement="right"
                title="Prometheus"
                onClick={() => setSelectedUrl("http://prometheus.minikube.com:9090/query")}
              >
                <img
                  src="/icons/prometheus.svg"
                  alt="Prometheus Icon"
                  width="24"
                  height="24"
                />
              </a>
            </li>
            <li>
              <a
                href="#"
                className="nav-link py-3 border-bottom rounded-0"
                data-bs-toggle="tooltip"
                data-bs-placement="right"
                title="Tekton"
                onClick={() => window.open("http://tekton.minikube.com:9097/#/about", "_blank")}
              >
                <img
                  src="/icons/tekton.svg"
                  alt="Tekton Icon"
                  width="24"
                  height="24"
                />
              </a>
            </li>
            <li>
              <a
                href="#"
                className="nav-link py-3 border-bottom rounded-0"
                data-bs-toggle="tooltip"
                data-bs-placement="right"
                title="Argo-cd"
                onClick={() => window.open("https://argocd.minikube.com/login?return_url=https%3A%2F%2Fargocd.minikube.com%2Fapplications", "_blank")}
              >
                <img
                  src="/icons/argocd.svg"
                  alt="Argo Icon"
                  width="24"
                  height="24"
                />
              </a>
            </li>            
          </ul>

          {/* Dropdown para configuraciones */}
          <div className="dropdown border-top">
            <a
              href="#"
              className="d-flex align-items-center justify-content-center p-3 link-body-emphasis text-decoration-none dropdown-toggle"
              data-bs-toggle="dropdown"
              aria-expanded="false"
            >
              <img
                src="/apple-touch-icon.png"
                alt="Configuraciones"
                width="24"
                height="24"
                className="rounded-circle"
              />
            </a>
            <ul className="dropdown-menu text-small shadow">
              <li>
                <a className="dropdown-item" href="#">
                  New project...
                </a>
              </li>
              <li>
                <a className="dropdown-item" href="#">
                  Settings
                </a>
              </li>
              <li>
                <a className="dropdown-item" href="#">
                  Profile
                </a>
              </li>
              <li>
                <hr className="dropdown-divider" />
              </li>
              <li>
                <a className="dropdown-item" href="#">
                  Sign out
                </a>
              </li>
            </ul>
          </div>
        </div>

        {/* Panel de contenido a la derecha */}
        <div className="flex-grow-1">
          <iframe
            src={selectedUrl}
            frameBorder="0"
            title="Monitoring Dashboard"
            style={{ width: '100%', height: '100%' }}
          ></iframe>
        </div>
      </div>
    </div>
  );
}

export default App;
