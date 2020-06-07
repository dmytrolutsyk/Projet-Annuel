package com.example.ft_android.Retrofit

import com.example.ft_android.models.DefaultResponse
import retrofit2.Call
import retrofit2.http.Field
import retrofit2.http.FormUrlEncoded
import retrofit2.http.POST

interface APIService {

    @POST("signup")
    @FormUrlEncoded
    fun createUser(
        @Field("username") username: String,
        @Field("password") password: String
    ): Call<DefaultResponse>
}