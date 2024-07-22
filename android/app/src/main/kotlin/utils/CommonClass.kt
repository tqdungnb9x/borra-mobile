package utils

import android.content.Context
import com.google.gson.Gson
import model.WidgetDataModel
import java.text.SimpleDateFormat
import java.util.Calendar
import java.util.Locale

class CommonClass {
    companion object{
        fun convertPxToDp(px: Float, context: Context): Float {
            val density = context.resources.displayMetrics.density
            return px / density
        }



        fun formatDateInKoreanStyle(): String {
            val calendar = Calendar.getInstance()
            val year = calendar.get(Calendar.YEAR)
            val month = calendar.get(Calendar.MONTH) + 1 // Tháng trong Calendar bắt đầu từ 0
            val day = calendar.get(Calendar.DAY_OF_MONTH)

            val sdf = SimpleDateFormat("yy년 M월 d월", Locale.KOREAN)
            return sdf.format(calendar.time)
        }

        fun insertCharacter(input: String, index: Int, character: String): String {
            val stringBuilder = StringBuilder(input)
            stringBuilder.insert(index, character)
            return stringBuilder.toString()
        }

        fun isJsonString(str: String) : Boolean {
            try {
                Gson().fromJson(str, WidgetDataModel::class.java)
            } catch (e: Exception) {
                return false;
            }
            return true;
        }
    }

}