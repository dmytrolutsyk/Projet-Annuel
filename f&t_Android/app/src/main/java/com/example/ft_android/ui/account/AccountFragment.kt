package com.example.ft_android.ui.account

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModelProviders
import com.example.ft_android.R

class AccountFragment : Fragment() {

    private lateinit var accountViewModel: AccountViewModel

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        accountViewModel =
                ViewModelProviders.of(this).get(AccountViewModel::class.java)
        val root = inflater.inflate(R.layout.fragment_account, container, false)
       // val textView: TextView = root.findViewById(R.id.text_account)
        //accountViewModel.text.observe(viewLifecycleOwner, Observer {
        //    textView.text = it
        //})
        return root
    }
}
