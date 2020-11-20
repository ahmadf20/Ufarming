import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ufarming/controllers/home_controller.dart';
import 'package:ufarming/controllers/weather_controller.dart';
import 'package:ufarming/models/weather_model.dart';
import 'package:ufarming/utils/my_colors.dart';
import 'package:ufarming/widgets/load_image.dart';
import 'package:ufarming/widgets/loading_indicator.dart';
import 'package:ufarming/widgets/my_app_bar.dart';

class WeatherScreen extends StatelessWidget {
  WeatherScreen({Key key}) : super(key: key);

  final WeatherController controller = Get.find<WeatherController>();
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: MyAppBar(
          title: 'Weather Forecast',
        ),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? loadingIndicator()
            : ListView(
                padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 25, 30, 25),
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
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Today',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    homeController.address.value,
                                    style: TextStyle(
                                      fontFamily: 'OpenSans',
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '${controller.weather.value.current.condition.text}',
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          '${controller.weather.value.current.tempC}ºC',
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
                                        'https:${controller.weather.value.current.condition.icon}'),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        Divider(height: 35),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  buildWeatherInfo(
                                    'Wind',
                                    '${controller.weather.value.current.windMph} m/h',
                                  ),
                                  SizedBox(height: 10),
                                  buildWeatherInfo(
                                    'Visibility',
                                    '${controller.weather.value.current.visKm} km',
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 50),
                            Expanded(
                              child: Column(
                                children: [
                                  buildWeatherInfo(
                                    'Humidity',
                                    '${controller.weather.value.current.humidity}%',
                                  ),
                                  SizedBox(height: 10),
                                  buildWeatherInfo(
                                    'UV',
                                    '${controller.weather.value.current.uv}',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 35),
                        Text(
                          'Next 3 Days',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: MyColors.darkGrey,
                          ),
                        ),
                        SizedBox(height: 25),
                        ...controller.weather.value.forecast.forecastday
                            .map((item) => buildCard(item))
                            .toList(),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Container buildCard(Forecastday item) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          loadImage(
            'https:${item.day.condition.icon}',
            height: 55,
          ),
          SizedBox(width: 25),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${DateFormat('EEEE').format(item.date)}',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: MyColors.darkGrey,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '${item.day.avgtempC}ºC',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: MyColors.primary,
                  ),
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rain',
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 12,
                  color: MyColors.grey,
                ),
              ),
              SizedBox(height: 5),
              Text(
                '${item.day.dailyChanceOfRain}%',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: MyColors.darkGrey,
                ),
              )
            ],
          ),
          SizedBox(width: 25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Humidity',
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 12,
                  color: MyColors.grey,
                ),
              ),
              SizedBox(height: 5),
              Text(
                '${item.day.avghumidity.toInt()}%',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: MyColors.darkGrey,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildWeatherInfo(String text1, String text2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: MyColors.darkGrey,
          ),
        ),
        Text(
          text2,
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: MyColors.grey,
          ),
        ),
      ],
    );
  }
}
