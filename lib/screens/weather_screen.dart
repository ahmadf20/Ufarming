import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ufarming/utils/my_colors.dart';
import 'package:ufarming/widgets/my_app_bar.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: MyAppBar(
          title: 'Weather Forecast',
        ),
      ),
      body: ListView(
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
                            '${DateFormat('EEEE, dd MMM').format(DateTime.now())}',
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.cloud_queue,
                              size: 40,
                              color: MyColors.darkGrey,
                            ),
                            SizedBox(width: 15),
                            Column(
                              children: [
                                Text(
                                  'Cloudy',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '28ºC',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 18,
                                    color: MyColors.darkGrey,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          'Cimahi, Indonesia',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 12,
                            color: Colors.grey,
                          ),
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
                          buildWeatherInfo('Wind', '12 m/h'),
                          SizedBox(height: 10),
                          buildWeatherInfo('Visibility', '25 km'),
                        ],
                      ),
                    ),
                    SizedBox(width: 50),
                    Expanded(
                      child: Column(
                        children: [
                          buildWeatherInfo('Humidity', '55%'),
                          SizedBox(height: 10),
                          buildWeatherInfo('UV', '13'),
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
                  'Next 5 Days',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: MyColors.darkGrey,
                  ),
                ),
                SizedBox(height: 25),
                buildCard(),
                buildCard(),
                buildCard(),
                buildCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildCard() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Icon(
            Icons.wb_sunny_outlined,
            size: 35,
            color: MyColors.darkGrey,
          ),
          SizedBox(width: 25),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tuesday',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: MyColors.darkGrey,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '28ºC',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
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
                '46%',
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
                '74%',
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
