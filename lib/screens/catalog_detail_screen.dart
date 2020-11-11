import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ufarming/utils/my_colors.dart';
import 'package:ufarming/utils/my_text_field.dart';
import 'package:ufarming/widgets/my_app_bar.dart';
import 'package:ufarming/widgets/my_card.dart';
import 'package:ufarming/widgets/my_flat_button.dart';

class CatalogDetailScreen extends StatelessWidget {
  const CatalogDetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: MyAppBar(
          title: 'Detail Plant',
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(25),
        child: MyFlatButton(
          text: 'Grow It',
          onPressed: () => Get.bottomSheet(
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              padding: EdgeInsets.fromLTRB(25, 45, 25, 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Pick a Name!',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: MyColors.darkGrey,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Hey, your plant deserves a name! The only limit is your imagination.',
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 14,
                      color: MyColors.grey,
                    ),
                  ),
                  SizedBox(height: 15),
                  MyTextField(
                    hintText: 'Type a name here ...',
                  ),
                  SizedBox(height: 30),
                  MyFlatButton(
                    text: 'Start the Journey',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            enterBottomSheetDuration: Duration(microseconds: 200),
            exitBottomSheetDuration: Duration(microseconds: 200),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(25, 0, 25, 125),
        children: [
          Stack(
            children: [
              Positioned(
                right: -35,
                child: Image.asset(
                  'assets/images/tomato.png',
                ),
              ),
              Container(
                width: Get.width / 2,
                height: 180,
                margin: EdgeInsets.only(bottom: 25),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Spicy Parlsey',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          buildLabel('Easy', Icons.poll_outlined),
          SizedBox(height: 10),
          Wrap(
            spacing: 15,
            children: [
              buildLabel('Hydriponic', Icons.spa_outlined),
              buildLabel('Vegetable', Icons.eco_outlined)
            ],
          ),
          SizedBox(height: 20),
          Wrap(
            spacing: 15,
            children: [
              buildStatistic('5', 'Stages'),
              buildStatistic('34', 'Total Days'),
              buildStatistic('87%', 'Success Rate'),
            ],
          ),
          SizedBox(height: 25),
          Divider(
            color: Colors.grey[400],
          ),
          SizedBox(height: 22.5),
          MyCard(
            title: 'How to Set Up',
            body: 'Learn how to set up the environtment',
          ),
          MyCard(
            title: 'How to Grow It',
            body: 'Learn how to grow the plant like an expert',
          ),
          MyCard(
            title: 'Summary',
            body:
                'As a high value and high demand product, basil is an extremely popular cash crop in aquaponics, It is often thought of as an ideal crop in aquaponics, due to its high uptake of nitrogen',
            showDivider: true,
            showIcon: false,
          ),
        ],
      ),
    );
  }

  Column buildStatistic(String text1, String text2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text1,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: MyColors.darkGrey,
          ),
        ),
        Text(
          text2,
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: MyColors.grey,
          ),
        ),
      ],
    );
  }

  Row buildLabel(String text, IconData icon) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: Colors.grey,
        ),
        SizedBox(width: 7),
        Text(
          text,
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 16,
            color: MyColors.grey,
          ),
        ),
      ],
    );
  }
}
