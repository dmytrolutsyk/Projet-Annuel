package com.example.ft_android

import android.content.Intent
import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity

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

            val intent = Intent(this, Homepage::class.java)
            intent.putExtra("Username", Usernamecpt)
            intent.putExtra("Password", Passwordcpt)

            val text = "Please enter all fields!"
            val duration = Toast.LENGTH_SHORT
            val toast = Toast.makeText(applicationContext, text, duration)
            if (Usernamecpt == "" || Passwordcpt == ""){
                toast.show()
            }
            /*else {
                NetworkProvider.weaponApi.WeaponDTO(Usernamecpt, Passwordcpt)
                    .enqueue(object: retrofit2.Callback<Weapon> {
                        override fun onFailure(call: Call<Weapon>, t: Throwable) {
                            Toast.makeText(applicationContext, t.message, Toast.LENGTH_LONG).show()
                            Toast.makeText(applicationContext,"zebi marche pas", duration).show()
                        }

                        override fun onResponse(call: Call<Weapon>, response: Response<Weapon>) {
                            Toast.makeText(applicationContext, response.body()?.message, Toast.LENGTH_LONG).show()
                            Log.i("", "post status to API" + response.body()!!.message)
                            Toast.makeText(applicationContext,"yallah", duration).show()
                        }

                    })
                startActivity(intent)
            }*/
        }
    }
}

