import 'package:flutter/material.dart';
import 'package:ufarming/utils/logger.dart';

import 'screens/main_screen.dart';
import 'screens/welcome_screen.dart';
import 'utils/shared_preferences.dart';

class BaseWidget extends StatefulWidget {
  BaseWidget({Key key}) : super(key: key);

  @override
  _BaseWidgetState createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {
  String token;

  Future getSavedToken() async {
    token = await getToken();
    logger.i(token);
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getSavedToken();
  }

  @override
  Widget build(BuildContext context) {
    return token != null ? MainScreen() : WelcomeScreen();
  }
}
