package com.example.ft_android.Retrofit

import retrofit2.http.Field
import retrofit2.http.FormUrlEncoded
import retrofit2.http.POST

interface APIService {

    @POST("signup")
    @FormUrlEncoded
    fun registrationPost(@Field("username") email: String,
                         @Field("password") password: String)
}
    //**App Utils**

    object ApiUtils {

        val BASE_URL = "https://findandtrade.herokuapp.com/"

        val apiService: APIService
            get() = RetrofitClient.getClient(BASE_URL)!!.create(APIService::class.java)
    }
/*
    @POST("signup")
    @FormUrlEncoded
    Observable<String> registerUserPrincipal: UserPrincipal(@Field('username'),
                                                            @Field('Password'))

    @POST("signin")
    @FormUrlEncoded
    Observable<String> registerUserPrincipal: UserPrincipal(@Field('username'),
                                                            @Field('Password')) */


