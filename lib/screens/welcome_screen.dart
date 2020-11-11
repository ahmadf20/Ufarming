import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:ufarming/screens/auth_screen.dart';
import 'package:ufarming/utils/my_colors.dart';
import 'package:ufarming/widgets/my_flat_button.dart';
import 'package:ufarming/widgets/my_outline_button.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/leaves1.png',
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(35, 0, 35, 45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "URBAN \nFARMING",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700,
                      fontSize: 35,
                      color: MyColors.darkGrey,
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    "The love of gardening is a seed once sown that never dies. — Gertrude Jekyll",
                    style: TextStyle(
                      fontFamily: "OpenSans",
                      fontSize: 14,
                      color: MyColors.grey,
                    ),
                  ),
                  SizedBox(height: 35),
                  MyOutlineButton(
                    text: 'SIGN IN',
                    onPressed: () {
                      Get.to(AuthScreen());
                    },
                  ),
                  SizedBox(height: 15),
                  MyFlatButton(
                    text: 'GET STARTED',
                    onPressed: () {
                      Get.to(AuthScreen(
                        authState: AuthState.register,
                      ));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
