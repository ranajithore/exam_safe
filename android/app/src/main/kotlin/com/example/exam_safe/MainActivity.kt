package com.example.exam_safe

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import android.view.WindowManager
import android.view.WindowManager.LayoutParams

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
      super.onCreate(savedInstanceState)
      this.getWindow().setFlags(WindowManager.LayoutParams.FLAG_SECURE, WindowManager.LayoutParams.FLAG_SECURE)
    }
}
