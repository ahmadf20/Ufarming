import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ufarming/controllers/edit_profile_controller.dart';
import 'package:ufarming/utils/my_colors.dart';
import 'package:ufarming/utils/my_text_field.dart';
import 'package:ufarming/widgets/load_image.dart';
import 'package:ufarming/widgets/my_app_bar.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<EditProfileController>(
      init: EditProfileController(),
      builder: (s) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: MyAppBar(
              title: 'Edit Profile',
              centerTitle: false,
              actions: [
                GestureDetector(
                  onTap: s.saveHandler,
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
                  Container(
                    width: 90,
                    height: 90,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: s.user.value.profilePicture.isNotEmpty &&
                              s.user.value.profilePicture != null
                          ? loadImage(s.user.value.profilePicture)
                          : Image.asset(
                              'assets/images/profile.png',
                              width: 90,
                              height: 90,
                            ),
                    ),
                  ),
                  SizedBox(height: 13),
                  GestureDetector(
                    onTap: s.updateImage,
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
                controller: s.emailTC,
                validator: (val) {
                  if (!val.isEmail) return 'Enter a valid email adress';
                },
              ),
              SizedBox(height: 12.5),
              MyTextField(
                label: 'Full Name',
                controller: s.nameTC,
              ),
              SizedBox(height: 12.5),
              MyTextField(
                label: 'Username',
                controller: s.usernameTC,
              ),
              SizedBox(height: 12.5),
              MyTextField(
                label: 'Password',
                controller: s.passTC,
                obscureText: true,
                validator: (val) {
                  if (s.passTC.text.isEmpty) return 'Password cannot be empty';
                },
              ),
              SizedBox(height: 12.5),
              MyTextField(
                  label: 'Re-Type Password',
                  controller: s.repassTC,
                  obscureText: true,
                  validator: (val) {
                    if (s.passTC.text != s.repassTC.text)
                      return 'Password don\'t match';
                  }),
            ],
          ),
        );
      },
    );
  }
}
