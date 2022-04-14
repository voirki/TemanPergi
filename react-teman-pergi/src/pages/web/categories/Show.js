//import hook react
import React, { useEffect, useState } from "react";

//import hook useParams react router dom
import { useParams } from "react-router-dom";

//import layout web
import LayoutWeb from "../../../layouts/Web";

//import BASE URL API
import Api from "../../../api";

//import card place component
import CardPlace from "../../../components/utilities/CardPlace";

function WebCategoryShow() {

    const [category, setCategory] = useState({});
    const [places, setPlaces] = useState([]);

    //get params from url
    const { slug } = useParams();

    //function "fetchDataCategory"
    const fetchDataCategory = async () => {

        //fetching Rest API
        await Api.get(`/api/web/categories/${slug}`)
            .then((response) => {

                //set data to state "category"
                setCategory(response.data.data);

                //set data to state "places"
                setPlaces(response.data.data.places);

                //set title from state "category"
                document.title = `Category : ${response.data.data.name} - Website Wisata Berbasis GIS (Geographic Information System)`;

            })
    }

    //hook
    useEffect(() => {

        //call function "fetchDataCategory"
        fetchDataCategory();
            
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [slug]);

    return (
        <React.Fragment>
            <LayoutWeb>
                <div className="container mt-80">
                    <div className="row">
                        <div className="col-md-12">
                            <h4>CATEGORY : <strong className="text-uppercase">{category.name}</strong></h4>
                            <hr />
                        </div>
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
                </div>
            </LayoutWeb>
        </React.Fragment>
    )

}

export default WebCategoryShow;