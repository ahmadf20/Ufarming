import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:ufarming/screens/welcome_screen.dart';
import 'package:ufarming/utils/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(mySystemUIOverlaySyle);

    return GetMaterialApp(
      title: 'Ufarming',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: WelcomeScreen(),
    );
  }
}
