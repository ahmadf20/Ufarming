import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ufarming/controllers/myplant_detail_controller.dart';
import 'package:ufarming/screens/article/article_detail_screen.dart';
import 'package:ufarming/screens/plant/plant_information_screen.dart';
import 'package:ufarming/utils/my_colors.dart';
import 'package:ufarming/utils/my_text_field.dart';
import 'package:ufarming/widgets/load_image.dart';
import 'package:ufarming/widgets/loading_indicator.dart';
import 'package:ufarming/widgets/my_app_bar.dart';
import 'package:ufarming/widgets/my_card.dart';

class MyPlantDetailScreen extends StatelessWidget {
  final String id;

  MyPlantDetailScreen({Key key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<MyPlantDetailController>(
      init: MyPlantDetailController(id),
      builder: (s) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: MyAppBar(
              title: 'Detail Plant',
            ),
          ),
          body: s.isLoading.value
              ? loadingIndicator()
              : ListView(
                  padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
                  children: [
                    Stack(
                      children: [
                        Positioned(
                          right: 0,
                          child: loadImage(
                            s.plant.value.plant.picture,
                            alignment: Alignment.centerRight,
                            height: 175,
                          ),
                        ),
                        Container(
                          width: Get.width / 2,
                          height: 180,
                          margin: EdgeInsets.only(bottom: 25),
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            s.plant.value.plant.plantName,
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
                    buildLabel(
                      s.plant.value.plant.difficulty,
                      Icons.poll_outlined,
                    ),
                    SizedBox(height: 10),
                    Wrap(
                      spacing: 15,
                      children: [
                        buildLabel(
                          s.plant.value.plant.categoryName,
                          Icons.spa_outlined,
                        ),
                        buildLabel(
                          s.plant.value.plant.typeName,
                          Icons.eco_outlined,
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Wrap(
                      spacing: 15,
                      children: [
                        buildStatistic(s.plant.value.plant.stages, 'Stages'),
                        buildStatistic(
                          s.plant.value.plant.totalDays,
                          'Total Days',
                        ),
                        buildStatistic(
                          '${double.parse(s.plant.value.plant.successRate).toInt()}%',
                          'Success Rate',
                        ),
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
                      onTap: () => Get.to(
                          ArticleDetailScreen(data: s.plant.value.article)),
                    ),
                    MyCard(
                      title: 'How to Grow It',
                      body: 'Learn how to grow the plant like an expert',
                      onTap: () =>
                          Get.to(PlantInformationScreen(data: s.plant.value)),
                    ),
                    MyCard(
                      title: 'Checklist',
                      showDivider: true,
                      showIcon: false,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Add Nutrition',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: MyColors.darkGrey,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Add 20gr nutrition to the water to make the plant grow faster.',
                                        style: TextStyle(
                                          fontFamily: 'OpenSans',
                                          fontSize: 12,
                                          color: MyColors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  splashColor: MyColors.grey,
                                  icon: Image.asset(
                                    'assets/icons/check_false.png',
                                    width: 20,
                                  ),
                                  onPressed: () {
                                    print('Tapped');
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    MyCard(
                      title: 'Activity',
                      showDivider: true,
                      showIcon: false,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: MyTextField(
                              hintText: 'Add your activity...',
                              controller: s.controller,
                              suffix: GestureDetector(
                                child: Icon(
                                  Icons.send_outlined,
                                  color: MyColors.grey,
                                  size: 17.5,
                                ),
                                onTap: () {},
                              ),
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.only(top: 25, left: 2.5),
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Add extra nutrition',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: MyColors.darkGrey,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            '1 Hours ago',
                                            style: TextStyle(
                                              fontFamily: 'OpenSans',
                                              fontSize: 10,
                                              color: MyColors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      splashColor: MyColors.grey,
                                      icon: Icon(
                                        Icons.cancel_outlined,
                                        color: MyColors.grey,
                                        size: 20,
                                      ),
                                      onPressed: () {
                                        print('Tapped');
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        );
      },
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
