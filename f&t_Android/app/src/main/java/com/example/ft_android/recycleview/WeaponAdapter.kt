package com.example.ft_android.recycleview


import android.os.Bundle
import android.util.Log
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import com.example.ft_android.model.Weapon
import com.example.ft_android.service.NetworkListener
import com.example.ft_android.service.NetworkProvider
//import com.axt.esgi.esgi3a.databinding.ActivityWeaponsBinding

class WeaponsActivity : AppCompatActivity() {


    private lateinit var binding: ActivityWeaponsBinding
    private val weaponAdapter by lazy { WeaponAdapter() }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityWeaponsBinding.inflate(layoutInflater)
        setContentView(binding.root)
        initRecyclerView()
    }

    override fun onResume() {
        super.onResume()
        getData()
    }

    private fun initRecyclerView() {
        binding.recyclerview.layoutManager = LinearLayoutManager(this)
        binding.recyclerview.adapter = weaponAdapter
    }

    private fun getData() {
        NetworkProvider.getWeapons(object : NetworkListener<List<Weapon>> {
            override fun onSuccess(data: List<Weapon>) {
                Log.d("WeaponsActivity", data.toString())
                weaponAdapter.weaponList = data
            }

            override fun onError(t: Throwable) {
                Log.e("WeaponsActivity", t.localizedMessage)
            }
        })
    }
}
