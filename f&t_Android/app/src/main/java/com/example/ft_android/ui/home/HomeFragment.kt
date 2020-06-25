package com.example.ft_android.ui.home

import android.annotation.SuppressLint
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModelProviders
import com.example.ft_android.R

class HomeFragment : Fragment() {

    private lateinit var homeViewModel: HomeViewModel

    @SuppressLint("ResourceType")
    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        homeViewModel =
                ViewModelProviders.of(this).get(HomeViewModel::class.java)
        val root = inflater.inflate(R.layout.fragment_home, container, false)
        /*val DeconnexionBtn = root.findViewById<Button>(R.id.DeconnexionBtn)
        DeconnexionBtn.setOnClickListener {
            //val intent = Intent(this, MainActivity::class.java)
            val root2 = inflater.inflate(R.layout.activity_main, container, false)
           // startActivity(root2)

        }*/
        //FINIR L'IMPLEMENTATION DU BOUTTON DECONNEXION PUTAIN
        //val textView: TextView = root.findViewById(R.id.text_home)
        //homeViewModel.text.observe(viewLifecycleOwner, Observer {
        //    textView.text = it
        //})
        return root
    }
}
