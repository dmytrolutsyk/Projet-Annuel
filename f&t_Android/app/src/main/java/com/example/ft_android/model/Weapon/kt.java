package com.example.ft_android.model.Weapon;


data class Weapon(val type: WeaponType, val name: String, val pictureUrl: String)
enum class WeaponType(private val id: String, private val type: String) {
    NONE("", ""),
    BOW("1", "bow"),
    SWORD("2", "sword"),
    AXE("3", "axe"),
    STAFF("4", "staff");
    companion object {
        fun getById(id: String) = values().find { it.id == id } ?: NONE
    }
}