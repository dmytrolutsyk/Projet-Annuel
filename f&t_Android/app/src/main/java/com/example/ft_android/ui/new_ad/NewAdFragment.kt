package com.example.ft_android.ui.new_ad

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ArrayAdapter
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModelProviders
import com.example.ft_android.R

class NewAdFragment : Fragment() {

    private lateinit var NewadViewModel: AdViewModel

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        val type = resources.getStringArray(R.array.Type)
        val spinner = activity.findViewById(R.id.spinner).setOnClickListener(this);
        if (spinner != null) {
            val adapter = ArrayAdapter(this,
                android.R.layout.simple_spinner_item, type)
            spinner.adapter = adapter
        NewadViewModel =
                ViewModelProviders.of(this).get(AdViewModel::class.java)
        val root = inflater.inflate(R.layout.fragment_new_add, container, false)
        //val textView: TextView = root.findViewById(R.id.text_newAdd)
        //NewadViewModel.text.observe(viewLifecycleOwner, Observer {
        //    textView.text = it
        //})
        return root
    }
}
