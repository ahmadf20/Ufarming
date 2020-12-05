import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:ufarming/controllers/myplant_detail_controller.dart';
import 'package:ufarming/models/activity_model.dart';
import 'package:ufarming/models/checklist_model.dart';
import 'package:ufarming/models/myplant_model.dart';
import 'package:ufarming/screens/article/article_detail_screen.dart';
import 'package:ufarming/screens/plant/plant_information_screen.dart';
import 'package:ufarming/utils/my_colors.dart';
import 'package:ufarming/utils/my_text_field.dart';
import 'package:ufarming/widgets/load_image.dart';
import 'package:ufarming/widgets/loading_indicator.dart';
import 'package:ufarming/widgets/my_app_bar.dart';
import 'package:ufarming/widgets/my_card.dart';
import 'package:ufarming/widgets/my_flat_button.dart';
import 'package:timeago/timeago.dart' as timeago;

class MyPlantDetailScreen extends StatelessWidget {
  final MyPlant data;

  MyPlantDetailScreen({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<MyPlantDetailController>(
      init: MyPlantDetailController(data.id, data.idPlant),
      builder: (s) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: MyAppBar(
              title: 'Detail Plant',
              actions: [
                if (data.isDone)
                  IconButton(
                    icon: Icon(Icons.delete_outline),
                    onPressed: () {
                      s.delMyPlant();
                    },
                  )
              ],
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
                            data.picture,
                            alignment: Alignment.centerRight,
                            height: 175,
                          ),
                        ),
                        Container(
                          width: Get.width / 2,
                          height: 180,
                          margin: EdgeInsets.only(bottom: 25),
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.name,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                data.plantName,
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontSize: 16,
                                  color: MyColors.grey,
                                ),
                              ),
                              SizedBox(height: 25),
                              Container(
                                width: 150,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Progress',
                                      style: TextStyle(
                                        fontFamily: 'OpenSans',
                                        fontSize: 10,
                                        color: MyColors.grey,
                                      ),
                                    ),
                                    Text(
                                      '${data.isDone ? 100 : data.progress}%',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: MyColors.darkGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              LinearPercentIndicator(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                width: 150,
                                lineHeight: 5,
                                percent: double.parse(
                                        data.isDone ? '100' : data.progress) /
                                    100,
                                progressColor: MyColors.gold,
                                backgroundColor: MyColors.lightGrey,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (!data.isDone) SizedBox(height: 50),
                    if (!data.isDone)
                      Container(
                        width: Get.width,
                        child: Row(
                          children: [
                            Expanded(
                              child: MyFlatButton(
                                text: 'Stop',
                                color: MyColors.lightGrey,
                                textColor: MyColors.darkGrey,
                                onPressed: () {
                                  s.delMyPlant();
                                },
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: MyFlatButton(
                                text: 'Finish',
                                onPressed: () {
                                  s.finishGrowingHandler();
                                  Get.back();
                                },
                              ),
                            ),
                          ],
                        ),
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
                    if (!data.isDone)
                      MyCard(
                        title: 'Checklist',
                        showDivider: true,
                        showIcon: false,
                        child: s.isLoadingChecklist.value
                            ? loadingIndicator()
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: s.checkList.length,
                                itemBuilder: (context, index) {
                                  CheckList item = s.checkList[index];

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
                                                item.title,
                                                style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: MyColors.darkGrey,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                item.desc,
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
                                            item.isChecked
                                                ? 'assets/icons/check_true.png'
                                                : 'assets/icons/check_false.png',
                                            width: 20,
                                          ),
                                          onPressed: () {
                                            s.checkAction(item.id);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                      ),
                    if (!data.isDone)
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
                                  onTap: () {
                                    if (s.controller.text.isNotEmpty)
                                      s.postActivity(data.id);
                                  },
                                ),
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: 25, left: 2.5),
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: s.activities.length,
                              itemBuilder: (context, index) {
                                final Activity item = s.activities[index];

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
                                              item.title,
                                              style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: MyColors.darkGrey,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              timeago.format(item?.createdAt ??
                                                  DateTime.now()),
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
                                          s.delActivity(item.id);
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
