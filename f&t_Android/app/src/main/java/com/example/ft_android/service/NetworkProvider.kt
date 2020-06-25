/*package com.example.ft_android.Retrofit

import okhttp3.OkHttpClient
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

object RetrofitClient {

    //private val AUTH =
    //    "Basic " + Base64.encodeToString("belalkhan:123456".toByteArray(), Base64.NO_WRAP)

    private const val BASE_URL = "https://findandtrade.herokuapp.com/"

    private val okHttpClient = OkHttpClient.Builder()
        .addInterceptor { chain ->
            val original = chain.request()

            val requestBuilder = original.newBuilder()
                .addHeader("Content-Type", "application/json")
                .method(original.method(), original.body())

            val request = requestBuilder.build()
            chain.proceed(request)
        }.build()

    val instance: APIService = run {
        val retrofit = Retrofit.Builder()
            .baseUrl(BASE_URL)
            .addConverterFactory(GsonConverterFactory.create())
            .client(okHttpClient)
            .build()

        retrofit.create(APIService::class.java)
    }
}*/
/*package com.example.ft_android.service

import com.example.ft_android.model.Weapon
import com.example.ft_android.service.dto.WeaponDTO
import com.example.ft_android.service.dto.WeaponMapper
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

object NetworkProvider {
    private val weaponApi: WeaponApi
    init {
        val retrofit: Retrofit = Retrofit.Builder()
            .baseUrl("//findandtrade.herokuapp.com/")
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            weaponApi = retrofit.create(WeaponApi::class.java)
        }

    fun getWeapons(listener: NetworkListener<List<Weapon>>) {

        weaponApi.getWeapons().enqueue(object : Callback<List<WeaponDTO>> {
            override fun onFailure(call: Call<List<WeaponDTO>>, t: Throwable) {
                //Do on error
                listener.onError(t)
            }

            override fun onResponse(call: Call<List<WeaponDTO>>, response: Response<List<WeaponDTO>>) {
                val dtoList = response.body()
                dtoList?.let {
                    val weapons = WeaponMapper().map(it)
                    listener.onSuccess(weapons)
                } ?: listener.onError(Exception())
            }
        })
    }

    /*fun getWeapon(id: String, listener: NetworkListener<Weapon>) {
        weaponApi.getWeapon(id).enqueue(object : Callback<WeaponDTO> {
            override fun onFailure(call: Call<WeaponDTO>, t: Throwable) {
                listener.onError(t)
            }

            override fun onResponse(call: Call<WeaponDTO>, response: Response<WeaponDTO>) {
                val dto = response.body()
                dto?.let {
                    val weapon = WeaponMapper().mapWeapon(it)
                    listener.onSuccess(weapon)
                } ?: listener.onError(Exception())
            }

        })
    }*/
}

interface NetworkListener<T> {
    fun onSuccess(weapons: List<Weapon>)
    fun onError(t: Throwable)
}*/