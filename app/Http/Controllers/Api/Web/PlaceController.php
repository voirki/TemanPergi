<?php

namespace App\Http\Controllers\Api\Web;

use App\Models\Place;
use App\Http\Controllers\Controller;
use App\Http\Resources\PlaceResource;

class PlaceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //get places
        $places = Place::with('category', 'images')->when(request()->q, function($places) {
            $places = $places->where('title', 'like', '%'. request()->q . '%');
        })->latest()->paginate(8);
        
        //return with Api Resource
        return new PlaceResource(true, 'List Data Places', $places);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($slug)
    {
        $place = Place::with('category', 'images')->where('slug', $slug)->first();
        
        if($place) {
            //return success with Api Resource
            return new PlaceResource(true, 'Detail Data Places : '.$place->title, $place);
        }

        //return failed with Api Resource
        return new PlaceResource(false, 'Data Place Tidak Ditemukan!', null);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function all_places()
    {
        //get places
        $places = Place::with('category', 'images')->latest()->get();
        
        //return with Api Resource
        return new PlaceResource(true, 'List Data Places', $places);
    }
}
