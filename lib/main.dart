import 'package:exam_safe/models/login_state.dart';
import 'package:exam_safe/models/app_state.dart';
import 'package:exam_safe/screens/LoadingScreen.dart';
import 'package:exam_safe/screens/LoginScreen.dart';
import 'package:exam_safe/screens/MoodleWebViewScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginState(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppState(),
        ),
      ],
      child: GestureDetector(
        onTap: () {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
        },
        child: MaterialApp(
          title: 'Exam Safe',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.purple,
            // This makes the visual density adapt to the platform that you run
            // the app on. For desktop platforms, the controls will be smaller and
            // closer together (more dense) than on mobile platforms.
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => LoginScreen(),
            '/moodle_screen': (context) => MoodleWebViewScreen(),
            '/loading_screen': (context) => LoadingScreen(),
          },
        ),
      ),
    );
  }
}
