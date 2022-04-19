<?php

namespace App\Http\Controllers\Api\Admin;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class LoginController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(Request $request)
    {
        //set validation
        $validator = Validator::make($request->all(), [
            'email'     => 'required|email',
            'password'  => 'required'
        ]);

        //if validation fail
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        //find user by email from request "email"
        $user = User::where('email', $request->email)->first();

        //if password from user and password from request not same
        if (!$user || !Hash::check($request->password, $user->password)) {
            
            //return with status code "400" and login failed
            return response()->json([
                'success' => false,
                'message' => 'Login Failed!',
            ], 400);
        }

        //user success login and create token
        return response()->json([
            'success' => true,
            'message' => 'Login Successfully!',
            'user'    => $user,
            'token'   => $user->createToken('authToken')->accessToken    
        ], 200);
    }
}
