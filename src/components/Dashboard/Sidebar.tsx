import React from "react";
import "bootstrap/dist/css/bootstrap.min.css";
import { Link } from "react-router-dom";
const Sidebar: React.FC = () => {
  return (
    <>
      <div className="bg-white" id="sidebar-wrapper">
        <div className="sidebar-heading text-center py-4 primary-text fs-4 fw-bold text-uppercase border-bottom sidebar__item">
          <i className="fas fa-user-secret me-2"></i>AlexStore
        </div>
        <ul className="list-group list-group-flush my-3">
          <li>
            <Link
              to={"/Lista"}
              className="list-group-item list-group-item-action bg-transparent "
            >
              Inicio
            </Link>
          </li>
          <li>
            <Link
              to={"/Productos"}
              className="list-group-item list-group-item-action "
            >
              Productos
            </Link>
          </li>
          <li>
            <Link
              to={"/Categoria"}
              className="list-group-item list-group-item-action "
            >
              Categoria
            </Link>
          </li>
          <li>
            <Link
              to={"/Clientes"}
              className="list-group-item list-group-item-action"
            >
              clientes
            </Link>
          </li>
          <li>
            <Link
              to={"/Vendedores"}
              className="list-group-item list-group-item-action "
            >
              Vendedores
            </Link>
          </li>
          <li>
            <Link
              to={"/Proveedores"}
              className="list-group-item list-group-item-action "
            >
              Proveedores
            </Link>
          </li>
          <li>
            <Link
              to={"/Salir"}
              className="list-group-item list-group-item-action "
            >
              Salir
            </Link>
          </li>
        </ul>
      </div>
    </>
  );
};

export default Sidebar;
