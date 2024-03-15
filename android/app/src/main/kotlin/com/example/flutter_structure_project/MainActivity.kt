package com.example.flutter_structure_project
import android.util.Log
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

private const val TAG = "MainActivity"

class MainActivity : FlutterFragmentActivity() {
    companion object {
        const val CHANNEL = "com.example.flutter_structure_project"
    };
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        Log.d(TAG, "configureFlutterEngine: ")
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
           if(call.method == "welcome"){
             try {
                 val args: List<Any> = call.arguments as List<Any>
                 val message :String = args[0] as String
                 Log.i("Welcome", message)
                 result.success(true)
             }catch (e : Exception){
                 Log.i("Welcome error: ", e.toString())
                 result.error(e.toString(),null,null)
             }
           }
        }

    }
}

