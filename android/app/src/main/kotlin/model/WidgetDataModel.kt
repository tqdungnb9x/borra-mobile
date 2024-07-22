package model

import com.google.gson.annotations.SerializedName


data class WidgetDataModel (
    @SerializedName("today") val today : List<Today>?,
    @SerializedName("item") val item : Item?,
    @SerializedName("fortune") val fortune : Fortune?
)

data class Fortune (
    @SerializedName("health") val health : Health?,
    @SerializedName("love") val love : Health?,
    @SerializedName("money") val money : Health?
)

data class Health (
    @SerializedName("name") val name : String? = "",
    @SerializedName("contents") val contents : String? = "0"
)

data class Item (
    @SerializedName("number") val number : Health?,
    @SerializedName("color") val color : Health?,
    @SerializedName("direction") val direction : Health?
)

data class Today (
    @SerializedName("word") val word : String? = "",
    @SerializedName("score") val score : String? = "0",
    @SerializedName("score_name") val scoreName : String? = ""
)
