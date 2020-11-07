import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:ufarming/screens/auth_screen.dart';
import 'package:ufarming/screens/profile/edit_profile_screen.dart';
import 'package:ufarming/utils/my_colors.dart';
import 'package:ufarming/widgets/my_app_bar.dart';
import 'package:ufarming/widgets/my_outline_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: MyAppBar(
          title: 'Profile',
          centerTitle: false,
          showLeading: false,
          actions: [
            GestureDetector(
              onTap: () => Get.to(EditProfileScreen()),
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 20, 25, 0),
                child: Text(
                  'Edit',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: MyColors.grey,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
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
                Text(
                  'afaaiz2',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: MyColors.darkGrey,
                  ),
                ),
                SizedBox(height: 2.5),
                Text(
                  '3 Active Plants',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 12,
                    color: MyColors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 35),
            buildSectionTitle('Personal Info'),
            buildListTile('Email Adress', 'afaaiz2@gmail.com'),
            buildListTile('Full Name', 'Ahmad Faaiz Al-auza\'i'),
            buildListTile('User Name', 'afaaiz2'),
            SizedBox(height: 35),
            buildSectionTitle('Settings'),
            buildListTile(
              'Set Location',
              'Cimahi, Indonesia',
              onTap: () {},
            ),
            buildListTile(
              'Test Notification',
              'Make sure your notification works properly',
              onTap: () {},
            ),
            buildListTile(
              'About Us',
              'Learn more about who develops this App',
              onTap: () {},
            ),
            SizedBox(height: 55),
            MyOutlineButton(
              text: 'Log Out',
              leading: Icon(
                Icons.meeting_room,
                color: Colors.red,
              ),
              color: Colors.red,
              onPressed: () {
                Get.offAll(AuthScreen());
              },
            ),
            SizedBox(height: 25),
            Text(
              'Ufarm v1.0.0',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 12,
                color: MyColors.grey,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  Column buildSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget buildListTile(String title, String subtitle, {Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12.5),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: MyColors.darkGrey,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 13,
                        color: MyColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              if (onTap != null)
                Icon(
                  Icons.keyboard_arrow_right,
                  color: MyColors.darkGrey,
                ),
            ],
          ),
          SizedBox(height: 12.5),
          Divider(color: MyColors.lightGrey),
        ],
      ),
    );
  }
}
