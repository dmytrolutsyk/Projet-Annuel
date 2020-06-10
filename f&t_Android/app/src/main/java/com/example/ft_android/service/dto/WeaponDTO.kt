package com.example.ft_android.service.dto


import com.google.gson.annotations.SerializedName

data class WeaponDTO(
    @SerializedName("name")
    val name: String,
    @SerializedName("pictureUrl")
    val pictureUrl: String,
    @SerializedName("type")
    val type: String
)