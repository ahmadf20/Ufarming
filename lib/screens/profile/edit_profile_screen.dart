import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:ufarming/utils/my_colors.dart';
import 'package:ufarming/utils/my_text_field.dart';
import 'package:ufarming/widgets/my_app_bar.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({Key key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController emailTC = TextEditingController();
  TextEditingController nameTC = TextEditingController();
  TextEditingController usernameTC = TextEditingController();
  TextEditingController passTC = TextEditingController();
  TextEditingController repassTC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: MyAppBar(
          title: 'Edit Profile',
          centerTitle: false,
          actions: [
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 20, 25, 0),
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: MyColors.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(25, 30, 25, 55),
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/profile.png',
                  width: 90,
                  height: 90,
                ),
              ),
              SizedBox(height: 13),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Edit Picture',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 12,
                    color: MyColors.grey,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          MyTextField(
            label: 'Email Address',
            controller: emailTC,
          ),
          SizedBox(height: 12.5),
          MyTextField(
            label: 'Full Name',
            controller: nameTC,
          ),
          SizedBox(height: 12.5),
          MyTextField(
            label: 'Username',
            controller: usernameTC,
          ),
          SizedBox(height: 12.5),
          MyTextField(
            label: 'Password',
            controller: passTC,
            obscureText: true,
          ),
          SizedBox(height: 12.5),
          MyTextField(
            label: 'Re-Type Password',
            controller: repassTC,
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
