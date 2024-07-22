package com.firstmecca.hellounsemobile

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.net.Uri
import android.view.View
import android.widget.RemoteViews
import androidx.core.widget.updateAppWidget
import com.google.gson.Gson
import es.antonborri.home_widget.HomeWidgetBackgroundIntent
import es.antonborri.home_widget.HomeWidgetLaunchIntent
import es.antonborri.home_widget.HomeWidgetPlugin
import model.WidgetDataModel
import utils.CommonClass

class LargeWidgetProvider : AppWidgetProvider() {

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        val widgetData = HomeWidgetPlugin.getData(context)
        for (appWidgetId in appWidgetIds) {
            appWidgetManager.updateAppWidget(appWidgetId) {
                val layoutId = R.layout.large_widget

                RemoteViews(context.packageName, layoutId).apply {

                    val pendingIntent = HomeWidgetLaunchIntent.getActivity(context,
                        MainActivity::class.java,  Uri.parse("myAppWidget://navigate/contentDetailWidget"))
                    setOnClickPendingIntent(R.id.widget_root, pendingIntent)
                    setTextViewText(R.id.date_time, CommonClass.formatDateInKoreanStyle())

                    val switchIntent = HomeWidgetBackgroundIntent.getBroadcast(context,
                        Uri.parse("myAppWidget://changeview?from=largeWidget"))
                    setOnClickPendingIntent(R.id.switch_1, switchIntent)
                    setOnClickPendingIntent(R.id.switch_2, switchIntent)
                    setOnClickPendingIntent(R.id.switch_3, switchIntent)
                    setOnClickPendingIntent(R.id.switch_4, switchIntent)

                    val value = widgetData.getBoolean("_viewWidget_2", false)
                    if(value){
                        setViewVisibility(R.id.widget_1, View.GONE)
                        setViewVisibility(R.id.widget_2, View.VISIBLE)
                    } else {
                        setViewVisibility(R.id.widget_1, View.VISIBLE)
                        setViewVisibility(R.id.widget_2, View.GONE)
                    }

                    val refreshIntent = HomeWidgetBackgroundIntent.getBroadcast(context,
                        Uri.parse("myAppWidget://refreshdata"))
                    setOnClickPendingIntent(R.id.refresh, refreshIntent)
                    setOnClickPendingIntent(R.id.refresh_1, refreshIntent)
                    val rawObjectData = widgetData.getString("title", "")
                    if(!rawObjectData.isNullOrEmpty()){
                        if(CommonClass.isJsonString(rawObjectData)){
                            val parsedObjectData = Gson().fromJson(rawObjectData, WidgetDataModel::class.java)
                            setTextViewText(R.id.quote,parsedObjectData?.today?.first()?.word ?: "No data")
                            setProgressBar(R.id.main_progress_bar,100,(parsedObjectData?.today?.first()?.score ?: "0").toInt(), false)
                            setTextViewText(R.id.percent_main_progress_bar, parsedObjectData?.today?.first()?.score ?: "0")
                            setTextViewText(R.id.score_name, parsedObjectData?.today?.first()?.scoreName ?: "-")

                            setTextViewText(R.id.number_name, parsedObjectData?.item?.number?.name ?: "행운의 수")
                            setTextViewText(R.id.number_contents, parsedObjectData?.item?.number?.contents ?: "-")

                            setTextViewText(R.id.color_name, parsedObjectData?.item?.color?.name ?: "행운의색")
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
                Uri.parse("myAppWidget://refreshdata?from=largeWidget")
            )
            backgroundIntent.send();
        }

    }
}