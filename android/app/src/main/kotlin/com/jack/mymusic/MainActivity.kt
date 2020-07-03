package com.jack.mymusic


import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.graphics.BitmapFactory
import android.os.Build
import android.os.Bundle
import android.util.Log
import android.widget.RemoteViews
import androidx.annotation.NonNull
import androidx.core.app.NotificationCompat
import com.google.gson.Gson
import com.jack.mymusic.Constants.Companion.ACTION_CLOSE
import com.jack.mymusic.Constants.Companion.ACTION_LIKE
import com.jack.mymusic.Constants.Companion.ACTION_LYRIC
import com.jack.mymusic.Constants.Companion.ACTION_NEXT
import com.jack.mymusic.Constants.Companion.ACTION_PLAY
import com.jack.mymusic.Constants.Companion.ACTION_PREVIOUS
import com.jack.mymusic.Constants.Companion.CHANNEL
import com.jack.mymusic.Constants.Companion.NOTIFICATION_ID
import com.jack.mymusic.Constants.Companion.REQUEST_CODE_CLOSE
import com.jack.mymusic.Constants.Companion.REQUEST_CODE_LIKE
import com.jack.mymusic.Constants.Companion.REQUEST_CODE_LYRIC
import com.jack.mymusic.Constants.Companion.REQUEST_CODE_NEXT
import com.jack.mymusic.Constants.Companion.REQUEST_CODE_PLAY
import com.jack.mymusic.Constants.Companion.REQUEST_CODE_PREVIOUS
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.JSONUtil
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant


class MainActivity : FlutterActivity() {
    lateinit var receiver:NotificationClickReceiver

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        receiver= NotificationClickReceiver()
        val intentFilter = IntentFilter()
        intentFilter.addAction(Constants.ACTION_LIKE)
        intentFilter.addAction(Constants.ACTION_PREVIOUS)
        intentFilter.addAction(Constants.ACTION_PLAY)
        intentFilter.addAction(Constants.ACTION_NEXT)
        intentFilter.addAction(Constants.ACTION_LYRIC)
        intentFilter.addAction(Constants.ACTION_CLOSE)
        registerReceiver(receiver, intentFilter)
    }

    override fun onDestroy() {
        unregisterReceiver(receiver)
        super.onDestroy()
    }

    lateinit var songPic:String
    lateinit var songName:String
    lateinit var songCreator:String
    lateinit var methodChannel:MethodChannel
    var isPlay:Boolean=false
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        this.methodChannel=MethodChannel(flutterEngine!!.dartExecutor, "com.jack.mymusic.toflutter");
        var methodChannel= MethodChannel(flutterEngine.dartExecutor, CHANNEL)
        methodChannel.setMethodCallHandler{
            call, result ->
            if(call.method == "showNotification") {
                songPic= call.argument<String>("songPic").toString()
                songName= call.argument<String>("songName").toString()
                songCreator= call.argument<String>("songCreator").toString()
                isPlay=true
                result.success(showNotification())
            }else if(call.method == "scanningLocalMusic") {
                var type=call.argument<String>("type").toString()
                var song=SongEntity()
                song.songs=ScanMusicUtils.getMusicData(this,type)
                var json=Gson().toJson(song)
                result.success(json)
            }else{
                result.notImplemented()
            }
        }
    }
    lateinit var  mNotificationManager:NotificationManager;
    private fun showNotification(): Boolean{
        isPlay=true
            mNotificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
            var importance = NotificationManager.IMPORTANCE_LOW
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                var mChannel = NotificationChannel(CHANNEL, "mymusic", importance)
                mNotificationManager.createNotificationChannel(mChannel)
            } else {

            }
        updateNotify()
        return true
    }
    lateinit var mRemoteViews:RemoteViews;
    private fun getContentView(): RemoteViews {
        mRemoteViews= RemoteViews(packageName,R.layout.view_notify)
        mRemoteViews.setImageViewBitmap(R.id.songIv,BitmapFactory.decodeFile(songPic))
        mRemoteViews.setTextViewText(R.id.songNameTv,songName)
        mRemoteViews.setTextViewText(R.id.songCreatorTv,songCreator)
        if(isPlay){
            mRemoteViews.setImageViewResource(R.id.playIv,R.drawable.note_btn_pause_white)
        }else{
            mRemoteViews.setImageViewResource(R.id.playIv,R.drawable.note_btn_play_white)
        }
        mRemoteViews.setOnClickPendingIntent(R.id.likeIv,PendingIntent.getBroadcast(this, REQUEST_CODE_LIKE, Intent(ACTION_LIKE), PendingIntent.FLAG_UPDATE_CURRENT))
        mRemoteViews.setOnClickPendingIntent(R.id.previousIv,PendingIntent.getBroadcast(this, REQUEST_CODE_PREVIOUS, Intent(ACTION_PREVIOUS), PendingIntent.FLAG_UPDATE_CURRENT))
        mRemoteViews.setOnClickPendingIntent(R.id.playIv,PendingIntent.getBroadcast(this, REQUEST_CODE_PLAY, Intent(ACTION_PLAY), PendingIntent.FLAG_UPDATE_CURRENT))
        mRemoteViews.setOnClickPendingIntent(R.id.nextIv,PendingIntent.getBroadcast(this, REQUEST_CODE_NEXT, Intent(ACTION_NEXT), PendingIntent.FLAG_UPDATE_CURRENT))
        mRemoteViews.setOnClickPendingIntent(R.id.lyricIv,PendingIntent.getBroadcast(this, REQUEST_CODE_LYRIC, Intent(ACTION_LYRIC), PendingIntent.FLAG_UPDATE_CURRENT))
        mRemoteViews.setOnClickPendingIntent(R.id.closeIv,PendingIntent.getBroadcast(this, REQUEST_CODE_CLOSE, Intent(ACTION_CLOSE), PendingIntent.FLAG_UPDATE_CURRENT))
        return mRemoteViews
    }

    inner class NotificationClickReceiver: BroadcastReceiver() {
        override fun onReceive(context: Context?, intent: Intent?) {
            print(intent!!.action)
            when(intent!!.action){
                ACTION_LIKE->{
                    methodChannel.invokeMethod("like",null)
                }
                ACTION_PREVIOUS->{
                    methodChannel.invokeMethod("previous",null)
                }
                ACTION_PLAY->{
                    isPlay=!isPlay
                    if(isPlay){
                        mRemoteViews.setImageViewResource(R.id.playIv,R.drawable.note_btn_pause_white)
                    }else{
                        mRemoteViews.setImageViewResource(R.id.playIv,R.drawable.note_btn_play_white)
                    }
                    methodChannel.invokeMethod("play",null)
                   updateNotify();
                }
                ACTION_NEXT->{
                    methodChannel.invokeMethod("next",null)
                }
                ACTION_LYRIC->{
                    methodChannel.invokeMethod("lyric",null)
                }
                ACTION_CLOSE->{
                    mNotificationManager.cancel(NOTIFICATION_ID)
                }
            }
        }

    }

    private fun updateNotify() {
        var notification = NotificationCompat.Builder(this, CHANNEL)
                .setWhen(System.currentTimeMillis())
                .setSmallIcon(R.drawable.mipush_small_notification)
                .setAutoCancel(false)
                .setOngoing(true)
                .setPriority(Notification.PRIORITY_MAX)
                .setContent(getContentView())
                .setChannelId(CHANNEL)
                .build()
        mNotificationManager.notify(NOTIFICATION_ID, notification);
    }

}
