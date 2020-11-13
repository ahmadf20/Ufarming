import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ufarming/controllers/profile_controller.dart';
import 'package:ufarming/screens/auth_screen.dart';
import 'package:ufarming/screens/profile/edit_profile_screen.dart';
import 'package:ufarming/utils/my_colors.dart';
import 'package:ufarming/utils/push_local_notif.dart';
import 'package:ufarming/utils/shared_preferences.dart';
import 'package:ufarming/widgets/load_image.dart';
import 'package:ufarming/widgets/loading_indicator.dart';
import 'package:ufarming/widgets/my_app_bar.dart';
import 'package:ufarming/widgets/my_outline_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<ProfileController>(
        init: ProfileController(),
        builder: (s) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: MyAppBar(
                title: 'Profile',
                centerTitle: false,
                showLeading: false,
                actions: [
                  if (!s.isLoading.value)
                    GestureDetector(
                      onTap: () => Get.to(
                        EditProfileScreen(),
                      ),
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
              child: s.isLoading.value
                  ? loadingIndicator()
                  : ListView(
                      padding: EdgeInsets.fromLTRB(25, 30, 25, 55),
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 90,
                              width: 90,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: s.user.value.profilePicture.isNotEmpty &&
                                        s.user.value.profilePicture != null
                                    ? loadImage(
                                        s.user.value.profilePicture,
                                      )
                                    : Image.asset('assets/images/profile.png'),
                              ),
                            ),
                            SizedBox(height: 13),
                            Text(
                              s.user.value.username ?? 'User',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: MyColors.darkGrey,
                              ),
                            ),
                            SizedBox(height: 2.5),
                            Text(
                              '${s.user.value.activePlant ?? '0'} Active Plants',
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
                        buildListTile(
                            'Email Adress', s.user.value.email ?? '-'),
                        buildListTile('Full Name', s.user.value.name ?? ''),
                        buildListTile(
                            'User Name', s.user.value.username ?? '-'),
                        SizedBox(height: 35),
                        buildSectionTitle('Settings'),
                        buildListTile(
                          'Set Location',
                          s.address.value.isEmpty ? 'not set' : s.address.value,
                          onTap: s.updateLocation,
                        ),
                        buildListTile(
                          'Test Notification',
                          'Make sure your notification works properly',
                          onTap: () {
                            showNotification(
                              'Test Notification',
                              'Yayy! The notification works fine!',
                              channelId: 'Test Notification',
                              channelDesc: 'Test Notification',
                              channelName: 'Test Notification',
                            );
                          },
                        ),
                        buildListTile(
                          'About App',
                          'Learn more about this App',
                          onTap: () {
                            showLicensePage(
                              context: context,
                              applicationIcon: Image.asset(
                                'assets/icons/launcher_icon.png',
                                width: MediaQuery.of(context).size.width * 0.5,
                              ),
                              applicationName: 'Ufarming',
                              applicationVersion: 'v1.0.0',
                            );
                          },
                        ),
                        SizedBox(height: 55),
                        MyOutlineButton(
                          text: 'Log Out',
                          leading: Icon(
                            Icons.meeting_room,
                            color: Colors.red,
                          ),
                          color: Colors.red,
                          onPressed: () async {
                            await logOut().then((res) {
                              if (res) Get.offAll(AuthScreen());
                            });
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
        });
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
      child: Container(
        color: Colors.transparent,
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
      ),
    );
  }
}
