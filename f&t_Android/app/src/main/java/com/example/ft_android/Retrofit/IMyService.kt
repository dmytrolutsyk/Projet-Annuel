package com.example.ft_android.Retrofit
import io.reactivex.Observable
import retrofit2.http.Field
import retrofit2.http.FormUrlEncoded
import retrofit2.http.POST
import java.nio.file.attribute.UserPrincipal

public interface IMyService(
    @POST("signup")
    @FormUrlEncoded
    Observable<String> registerUserPrincipal: UserPrincipal(@Field('username'),
                                                            @Field('Password'))

    @POST("signin")
    @FormUrlEncoded
    Observable<String> registerUserPrincipal: UserPrincipal(@Field('username'),
                                                            @Field('Password'))
)
