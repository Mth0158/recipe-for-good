import { BrowserRouter as Router, Link } from "react-router-dom"
import AppRoutes from "./components/AppRoutes"
import 'bootstrap/dist/css/bootstrap.min.css';
import './App.css';

function App() {
  return (
    <>
    <Router>
        <div className="container">
          <div className="row justify-content-center">
            <div className="col-12 col-lg-8 col-xl-6">
              <AppRoutes />
            </div>
          </div>
        </div>
    </Router>
    </>
  )
}

export default App
