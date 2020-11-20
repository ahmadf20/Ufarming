import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ufarming/controllers/home_controller.dart';
import 'package:ufarming/controllers/weather_controller.dart';
import 'package:ufarming/screens/weather_screen.dart';
import 'package:ufarming/utils/my_colors.dart';
import 'package:ufarming/widgets/load_image.dart';
import 'package:ufarming/widgets/loading_indicator.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

  final HomeController homeController = Get.put(HomeController());
  final WeatherController weatherController = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 60, 25, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Home',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "The love of gardening is a seed once sown that never dies. — Gertrude Jekyll",
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: MyColors.grey,
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () => Get.to(WeatherScreen()),
              child: Container(
                  padding: EdgeInsets.fromLTRB(30, 15, 10, 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(25),
                        blurRadius: 35,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Today',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Obx(
                                        () => Text(
                                          homeController.address.value,
                                          style: TextStyle(
                                            fontFamily: 'OpenSans',
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10),
                                Obx(() {
                                  return weatherController.isLoading.value
                                      ? loadingIndicator()
                                      : Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  weatherController
                                                      .weather
                                                      .value
                                                      .current
                                                      .condition
                                                      .text,
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 12,
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                SizedBox(height: 5),
                                                Text(
                                                  '${weatherController.weather.value.current.tempC.toString()}ºC',
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 18,
                                                    color: MyColors.darkGrey,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(width: 15),
                                            loadImage(
                                                'https:${weatherController.weather.value.current.condition.icon}'),
                                          ],
                                        );
                                }),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 75,
                        child: VerticalDivider(),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: Colors.grey,
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
