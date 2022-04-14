//import react  
import React, { useState, useEffect } from "react";

//import layout admin
import LayoutAdmin from "../../../layouts/Admin";

//import BASE URL API
import Api from "../../../api";

//import js cookie
import Cookies from "js-cookie";

function Dashboard() {

    //title page
    document.title = "Dashboard - Administrator Travel GIS";

    //set state
    const [categories, setCategories] = useState(0);
    const [places, setPlaces] = useState(0);
    const [sliders, setSliders] = useState(0);
    const [users, setUsers] = useState(0);

    //token
    const token = Cookies.get('token');

    //function fetchData
    const fetchData = async () => {

        //fetching data from Rest API
        const response = await Api.get('api/admin/dashboard', {
            headers: {

                //header Bearer + Token
                Authorization: `Bearer ${token}`
            }
        });

        //get response data
        const data = await response.data.data;

        //assign response data to state
        setCategories(data.categories);
        setPlaces(data.places);
        setSliders(data.sliders);
        setUsers(data.users);
    }

    //hook useEffect
    useEffect(() => {

        //call method "fetchData"
        fetchData();

        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, []);

    return (
        <React.Fragment>
            <LayoutAdmin>
                <div className="row mt-4">
                    <div className="col-12 col-lg-3 mb-4">
                    <div className="card border-0 shadow-sm overflow-hidden">
                        <div className="card-body p-0 d-flex align-items-center">
                            <div className="bg-primary py-4 px-5 mfe-3" style={{ width: "130px" }}>
                                <i className="fas fa-folder fa-2x text-white"></i>
                            </div>
                            <div>
                                <div className="text-value text-primary">{categories}</div>
                                <div className="text-muted text-uppercase font-weight-bold small">
                                    CATEGORIES
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                    <div className="col-12 col-lg-3 mb-4">
                    <div className="card border-0 rounded shadow-sm overflow-hidden">
                        <div className="card-body p-0 d-flex align-items-center">
                            <div className="bg-success py-4 px-5 mfe-3" style={{ width: "130px" }}>
                                <i className="fas fa-map-marked-alt fa-2x text-white"></i>
                            </div>
                            <div>
                                <div className="text-value text-success">{places}</div>
                                <div className="text-muted text-uppercase font-weight-bold small">
                                    PLACES
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                    <div className="col-12 col-lg-3 mb-4">
                    <div className="card border-0 rounded shadow-sm overflow-hidden">
                        <div className="card-body p-0 d-flex align-items-center">
                            <div className="bg-warning py-4 px-5 mfe-3" style={{ width: "130px" }}>
                                <i className="fas fa-images fa-2x text-white"></i>
                            </div>
                            <div>
                                <div className="text-value text-warning">{sliders}</div>
                                <div className="text-muted text-uppercase font-weight-bold small">
                                    SLIDERS
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                    <div className="col-12 col-lg-3 mb-4">
                    <div className="card border-0 rounded shadow-sm overflow-hidden">
                        <div className="card-body p-0 d-flex align-items-center">
                            <div className="bg-danger py-4 px-5 mfe-3" style={{ width: "130px" }}>
                                <i className="fas fa-users fa-2x text-white"></i>
                            </div>
                            <div>
                                <div className="text-value text-danger">{users}</div>
                                <div className="text-muted text-uppercase font-weight-bold small">
                                    USERS
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
            </LayoutAdmin>
        </React.Fragment>
    )

}

export default Dashboard;