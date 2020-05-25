package com.example.ft_android

import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.example.ft_android.Retrofit.APIService
import com.example.ft_android.Retrofit.ApiUtils
import okhttp3.Call
import okhttp3.Callback
import okhttp3.Response

class MainActivity : AppCompatActivity() {

    private lateinit var ValidateBtn: Button
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        var ValidateBtn = findViewById<View>(R.id.ValidateBtn)
        ValidateBtn.setOnClickListener {
            //Navigate
            var Username = findViewById<View>(R.id.UsernameField) as EditText
            val Usernamecpt = Username.text.toString()
            var Password = findViewById<View>(R.id.PasswordField) as EditText
            val Passwordcpt = Password.text.toString()

            ////////////////////////////////////////////////////////////////////////////////////////
            //Variable declaration
            var mAPIService: APIService? = null
            //After oncreate
            mAPIService = ApiUtils.apiService
            //Some Button click

            mAPIService!!.registrationPost("totomaster", "123456").enqueue(object :
                Callback<Registration> {
                override fun onResponse(
                    call: Call<Registration>,
                    response: Response<Registration>
                ) {

                    Log.i("", "post submitted to API." + response.body()!!)

                    if (response.isSuccessful()) {

                        Log.i("", "post registration to API" + response.body()!!.toString())
                        Log.i("", "post status to API" + response.body()!!.status)
                        Log.i("", "post msg to API" + response.body()!!.messages)

                    }
                }

                override fun onFailure(call: Call<Registration>, t: Throwable) {

                }
            })
            ////////////////////////////////////////////////////////////////////////////////////////

            val intent = Intent(this, Homepage::class.java)
            intent.putExtra("Username", Usernamecpt)
            intent.putExtra("Password", Passwordcpt)

            val text = "Please enter all fields!"
            val duration = Toast.LENGTH_SHORT
            val toast = Toast.makeText(applicationContext, text, duration)
            if (Usernamecpt == "" || Passwordcpt == ""){
                toast.show()
            }
            else {
                startActivity(intent)
            }
        }
    }
}

