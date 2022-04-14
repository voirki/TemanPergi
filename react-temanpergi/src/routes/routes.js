//import react router dom
import { Switch, Route } from "react-router-dom";

//import component private routes
import PrivateRoute from "./PrivateRoutes";

//=======================================================================
//ADMIN
//=======================================================================

//import view Login
import Login from '../pages/admin/Login';

//import view admin Dashboard
import Dashboard from '../pages/admin/dashboard/Index';

//import view admin categories Index
import CategoriesIndex from '../pages/admin/categories/Index';

//import view admin category Create
import CategoryCreate from '../pages/admin/categories/Create';

//import view admin category Edit
import CategoryEdit from '../pages/admin/categories/Edit';

//import view admin places Index
import PlacesIndex from '../pages/admin/places/Index';

//import view admin places Create
import PlaceCreate from '../pages/admin/places/Create';

//import view admin places Edit
import PlaceEdit from '../pages/admin/places/Edit';

//import view admin sliders Index
import SlidersIndex from '../pages/admin/sliders/Index';

//import view admin slider Create
import SliderCreate from '../pages/admin/sliders/Create';

//import view admin users Index
import UsersIndex from '../pages/admin/users/Index';

//import view admin user Create
import UserCreate from '../pages/admin/users/Create';

//import view admin user Edit
import UserEdit from '../pages/admin/users/Edit';

function Routes() {
    return (
        <Switch>

            {/* route "/adminlogin" */}
            <Route exact path="/admin/login">
                <Login /> 
            </Route>

            {/* private route "/admin/dashboard" */}
            <PrivateRoute exact path="/admin/dashboard">
                <Dashboard /> 
            </PrivateRoute>

            {/* private route "/admin/categories" */}
            <PrivateRoute exact path="/admin/categories">
                <CategoriesIndex /> 
            </PrivateRoute>

            {/* private route "/admin/categories/create" */}
            <PrivateRoute exact path="/admin/categories/create">
                <CategoryCreate /> 
            </PrivateRoute>

            {/* private route "/admin/categories/edit/:id" */}
            <PrivateRoute exact path="/admin/categories/edit/:id">
                <CategoryEdit /> 
            </PrivateRoute>

            {/* private route "/admin/places" */}
            <PrivateRoute exact path="/admin/places">
                <PlacesIndex /> 
            </PrivateRoute>

            {/* private route "/admin/places/create" */}
            <PrivateRoute exact path="/admin/places/create">
                <PlaceCreate /> 
            </PrivateRoute>

            {/* private route "/admin/places/edit/:id" */}
            <PrivateRoute exact path="/admin/places/edit/:id">
                <PlaceEdit /> 
            </PrivateRoute>

            {/* private route "/admin/sliders" */}    
            <PrivateRoute exact path="/admin/sliders">
                <SlidersIndex />
            </PrivateRoute>

            {/* private route "/admin/sliders/create" */}  
            <PrivateRoute exact path="/admin/sliders/create">
                <SliderCreate />
            </PrivateRoute>

            {/* private route "/admin/users" */}    
            <PrivateRoute exact path="/admin/users">
                <UsersIndex />
            </PrivateRoute>

            {/* private route "/admin/users/create" */}    
            <PrivateRoute exact path="/admin/users/create">
                <UserCreate />
            </PrivateRoute>

            {/* private route "/admin/users/edit/:id" */}
            <PrivateRoute exact path="/admin/users/edit/:id">
                <UserEdit /> 
            </PrivateRoute>
            
        </Switch>
    )
}

export default Routes