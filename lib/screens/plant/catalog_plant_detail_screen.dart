import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ufarming/controllers/catalog_detail_controller.dart';
import 'package:ufarming/screens/article/article_detail_screen.dart';
import 'package:ufarming/screens/plant/plant_information_screen.dart';
import 'package:ufarming/utils/my_colors.dart';
import 'package:ufarming/utils/my_text_field.dart';
import 'package:ufarming/widgets/load_image.dart';
import 'package:ufarming/widgets/loading_indicator.dart';
import 'package:ufarming/widgets/my_app_bar.dart';
import 'package:ufarming/widgets/my_card.dart';
import 'package:ufarming/widgets/my_flat_button.dart';

class CatalogDetailScreen extends StatelessWidget {
  final String id;

  CatalogDetailScreen({Key key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<CatalogDetailController>(
      init: CatalogDetailController(id),
      builder: (s) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: MyAppBar(
              title: 'Detail Plant',
            ),
          ),
          bottomSheet: s.isLoading.value
              ? Container()
              : Container(
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
                              controller: s.controller,
                            ),
                            SizedBox(height: 30),
                            MyFlatButton(
                              text: 'Start the Journey',
                              onPressed: s.addMyPlantHandler,
                            ),
                          ],
                        ),
                      ),
                      enterBottomSheetDuration: Duration(microseconds: 200),
                      exitBottomSheetDuration: Duration(microseconds: 200),
                    ),
                  ),
                ),
          body: s.isLoading.value
              ? loadingIndicator()
              : ListView(
                  padding: EdgeInsets.fromLTRB(25, 25, 25, 125),
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
                      title: 'Summary',
                      body: s.plant.value.plant.summary,
                      showDivider: true,
                      showIcon: false,
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
