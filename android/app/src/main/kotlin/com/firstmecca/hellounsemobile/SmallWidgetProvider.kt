package com.firstmecca.hellounsemobile

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.net.Uri
import android.os.Build
import android.util.TypedValue
import android.view.View
import android.widget.RemoteViews
import androidx.core.content.ContextCompat
import androidx.core.widget.RemoteViewsCompat.setViewBackgroundResource
import androidx.core.widget.updateAppWidget
import com.google.gson.Gson
import es.antonborri.home_widget.HomeWidgetBackgroundIntent
import es.antonborri.home_widget.HomeWidgetLaunchIntent
import es.antonborri.home_widget.HomeWidgetPlugin
import model.WidgetDataModel
import utils.CommonClass
import utils.CommonClass.Companion.convertPxToDp
import utils.CommonClass.Companion.formatDateInKoreanStyle
import utils.CommonClass.Companion.insertCharacter
import utils.WidgetSizeProvider


class SmallWidgetProvider : AppWidgetProvider() {

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        val widgetData = HomeWidgetPlugin.getData(context)
        for (appWidgetId in appWidgetIds) {
            appWidgetManager.updateAppWidget(appWidgetId) {
                val layoutId = R.layout.small_widget
                WidgetSizeProvider(context).getWidgetsSize(appWidgetId)

                val awo = WidgetSizeProvider(context).getWidgetsSize(appWidgetId)
                val w: Int = awo.first

                RemoteViews(context.packageName, layoutId).apply {

                    val pendingIntent = HomeWidgetLaunchIntent.getActivity(context,
                        MainActivity::class.java,  Uri.parse("myAppWidget://navigate/contentDetailWidget"))
                    setOnClickPendingIntent(R.id.widget_root, pendingIntent)
                    setTextViewText(R.id.date_time, formatDateInKoreanStyle())
                    // Pending intent to update counter on button click
                    val switchIntent = HomeWidgetBackgroundIntent.getBroadcast(context,
                        Uri.parse("myAppWidget://changeview?from=smallWidget"))
                    setOnClickPendingIntent(R.id.switch_1, switchIntent)
                    setOnClickPendingIntent(R.id.switch_2, switchIntent)
                    setOnClickPendingIntent(R.id.switch_3, switchIntent)
                    setOnClickPendingIntent(R.id.switch_4, switchIntent)
                    val value = widgetData.getBoolean("_viewWidget_1", false)
                    if(value){
                        setViewVisibility(R.id.widget_1, View.GONE)
                        setViewVisibility(R.id.widget_2, View.VISIBLE)
                    } else {
                        setViewVisibility(R.id.widget_1, View.VISIBLE)
                        setViewVisibility(R.id.widget_2, View.GONE)
                    }

                    val refreshIntent = HomeWidgetBackgroundIntent.getBroadcast(context,
                        Uri.parse("myAppWidget://refreshdata?from=smallWidget"))
                    setOnClickPendingIntent(R.id.refresh, refreshIntent)
                    setOnClickPendingIntent(R.id.refresh_1, refreshIntent)

                    val rawObjectData = widgetData.getString("title", "")
                    if(!rawObjectData.isNullOrEmpty()){
                        if(CommonClass.isJsonString(rawObjectData)){
                            val parsedObjectData = Gson().fromJson(rawObjectData, WidgetDataModel::class.java)
                            setTextViewText(R.id.quote, insertCharacter(parsedObjectData?.today?.first()?.word ?: "No data", (parsedObjectData?.today?.first()?.word?.length ?: 0)/2,"\n"))

                            setTextViewText(R.id.number_name, parsedObjectData?.item?.number?.name ?: "행운의 숫자")
                            setTextViewText(R.id.number_contents, parsedObjectData?.item?.number?.contents ?: "-")

                            setTextViewText(R.id.color_name, parsedObjectData?.item?.color?.name ?: "행운의 색상")
                            setTextViewText(R.id.color_contents, parsedObjectData?.item?.color?.contents ?: "-")

                            setTextViewText(R.id.direction_name, parsedObjectData?.item?.direction?.name ?: "행운의 장소")
                            setTextViewText(R.id.direction_contents, parsedObjectData?.item?.direction?.contents ?: "-")

                            setTextViewText(R.id.health_name, parsedObjectData?.fortune?.health?.name ?: "애정운")
                            setProgressBar(R.id.health_progress_bar, 100, (parsedObjectData?.fortune?.health?.contents ?: "0").toInt(), false)
                            setTextViewText(R.id.health_text, parsedObjectData?.fortune?.health?.contents ?: "0")

                            setTextViewText(R.id.love_name, parsedObjectData?.fortune?.love?.name ?: "금전운")
                            setProgressBar(R.id.love_progress_bar, 100, (parsedObjectData?.fortune?.love?.contents ?: "0").toInt(), false)
                            setTextViewText(R.id.love_text, parsedObjectData?.fortune?.love?.contents ?: "0")

                            setTextViewText(R.id.money_name, parsedObjectData?.fortune?.money?.name ?: "건강운")
                            setProgressBar(R.id.money_progress_bar, 100, (parsedObjectData?.fortune?.money?.contents ?: "0").toInt(), false)
                            setTextViewText(R.id.money_text, parsedObjectData?.fortune?.health?.contents ?: "0")


                            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                                setViewVisibility(R.id.normal_progress_bar, View.GONE);
                                setViewVisibility(R.id.custom_progress_bar, View.VISIBLE);
                                val score = (parsedObjectData?.today?.first()?.score ?: "0").toInt();
                                if(score in 0..30){
                                    setViewBackgroundResource(R.id.bg_custom_progress,R.drawable.bg_progress_bar_bad)
                                    setViewBackgroundResource(R.id.spacing,R.drawable.bg_progress_description_bad)
                                    setImageViewResource(R.id.progress_bar_ic, R.drawable.ic_bad)
                                } else if(score in  31..70){
                                    setViewBackgroundResource(R.id.bg_custom_progress,R.drawable.bg_progress_bar_normal)
                                    setViewBackgroundResource(R.id.spacing,R.drawable.bg_progress_description_normal)
                                    setImageViewResource(R.id.progress_bar_ic, R.drawable.ic_normal)
                                } else {
                                    setViewBackgroundResource(R.id.bg_custom_progress,R.drawable.bg_progress_bar_good)
                                    setViewBackgroundResource(R.id.spacing,R.drawable.bg_progress_description_good)
                                    setImageViewResource(R.id.progress_bar_ic, R.drawable.ic_good)
                                }
                                setViewLayoutWidth(R.id.spacing, convertPxToDp(w * score.toFloat()/100, context) - 24, TypedValue.COMPLEX_UNIT_DIP)

                            } else {
                                setViewVisibility(R.id.normal_progress_bar, View.VISIBLE);
                                setViewVisibility(R.id.custom_progress_bar, View.GONE);
                                setProgressBar(R.id.normal_progress_bar,100,(parsedObjectData?.today?.first()?.score ?: "0").toInt(), false)
                            }

                            setTextViewText(R.id.progress_number, "${(parsedObjectData?.today?.first()?.score ?: 0)}점")
                        }
                    }




                }
            }
        }
    }

    override fun onEnabled(context: Context?) {
        super.onEnabled(context)
        if(context != null) {
            val backgroundIntent = HomeWidgetBackgroundIntent.getBroadcast(
                context,
                Uri.parse("myAppWidget://refreshdata?from=smallWidget")
            )
            backgroundIntent.send();
        }

    }

}

