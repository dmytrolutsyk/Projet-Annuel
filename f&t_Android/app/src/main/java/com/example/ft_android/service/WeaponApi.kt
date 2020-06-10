package com.example.ft_android.service

import com.example.ft_android.service.dto.WeaponDTO
import retrofit2.Call
import retrofit2.http.GET
import retrofit2.http.Query

interface WeaponApi {
    @GET("weapons")
    fun getWeapons(): Call<List<WeaponDTO>>

    @GET("weapon")
    fun getWeapon(@Query("id") id: String): Call<WeaponDTO>
}