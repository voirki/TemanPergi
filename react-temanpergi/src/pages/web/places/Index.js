//import hook from react
import React, { useEffect, useState } from "react";

//import layout web
import LayoutWeb from "../../../layouts/Web";

//import BASE URL API
import Api from "../../../api";

//import card place component
import CardPlace from "../../../components/utilities/CardPlace";

//import pagination component
import PaginationComponent from "../../../components/utilities/Pagination";

function WebPlacesIndex() {

    //title page
    document.title = "Places - TRAVEL GIS - Website Wisata Berbasis GIS (Geographic Information System)";

    //state places
    const [places, setPlaces] = useState([]);

    //state currentPage
    const [currentPage, setCurrentPage] = useState(1);

    //state perPage
    const [perPage, setPerPage] = useState(0);

    //state total
    const [total, setTotal] = useState(0);

    //function "fetchDataPlaces"
    const fetchDataPlaces = async (pageNumber) => {

        //define variable "page"
        const page = pageNumber ? pageNumber : currentPage;

        //fetching Rest API
        await Api.get(`/api/web/places?page=${page}`)
            .then((response) => {

                //set data to state "places"
                setPlaces(response.data.data.data);

                //set currentPage
                setCurrentPage(response.data.data.current_page);

                //set perPage
                setPerPage(response.data.data.per_page);

                //total
                setTotal(response.data.data.total);
            })
    }

    //hook
    useEffect(() => {

        //call function "fetchDataPlaces"
        fetchDataPlaces();

        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, []);

    return (
        <React.Fragment>
            <LayoutWeb>
                <div className="container mt-80">
                    <div className="row">
                        {
                            places.length > 0
                                ? places.map((place) => (
                                    <CardPlace
                                        key={place.id}
                                        id={place.id}
                                        slug={place.slug}
                                        title={place.title}
                                        images={place.images}
                                        address={place.address}
                                    />
                                ))
                                : <div className="alert alert-danger border-0 rounded shadow-sm" role="alert">
                                    <strong>Opps...!</strong> Data Belum Tersedia!.
                                  </div>
                        }
                    </div>
                    <PaginationComponent 
                        currentPage={currentPage} 
                        perPage={perPage} 
                        total={total} 
                        onChange={(pageNumber) => fetchDataPlaces(pageNumber)}
                        position="center"
                    />
                </div>
            </LayoutWeb>
        </React.Fragment>
    )

}

export default WebPlacesIndex;