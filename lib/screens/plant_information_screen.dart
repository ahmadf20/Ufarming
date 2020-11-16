import 'package:flutter/material.dart';
import 'package:ufarming/models/plant_detail_model.dart';
import 'package:ufarming/utils/my_colors.dart';
import 'package:ufarming/widgets/load_image.dart';
import 'package:ufarming/widgets/my_app_bar.dart';
import 'package:ufarming/widgets/my_card.dart';

class PlantInformationScreen extends StatelessWidget {
  final PlantDetail data;

  const PlantInformationScreen({Key key, @required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: MyAppBar(),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(25, 0, 25, 25),
        children: [
          loadImage(
            data.plant.picture,
            height: 175,
            boxFit: BoxFit.contain,
          ),
          SizedBox(height: 25),
          Text(
            data.plant.plantName,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            data.plant.typeName,
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 14,
              color: MyColors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          MyCard(
            title: 'Summary',
            body: data.plant.summary,
            showDivider: true,
            showIcon: false,
          ),
          MyCard(
            title: 'Growing',
            body: data.plant.growing,
            showDivider: true,
            showIcon: false,
          ),
          MyCard(
            title: 'Harvesting',
            body: data.plant.harvesting,
            showDivider: true,
            showIcon: false,
          ),
          MyCard(
            title: 'Crop Statistics',
            showDivider: true,
            showIcon: false,
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Table(
                children: [
                  buildTableRow(
                    'Germination Days',
                    '${data.statistic.germDaysLow} - ${data.statistic.germDaysUp}',
                  ),
                  buildTableRow(
                    'Germination Temperature',
                    '${data.statistic.germTemperatureLow}ºC - ${data.statistic.germTemperatureUp}ºC',
                  ),
                  buildTableRow(
                    'Growth Days',
                    '${data.statistic.growthDaysLow} - ${data.statistic.growthDaysUp}',
                  ),
                  buildTableRow(
                    'Heigh',
                    '${data.statistic.heightLow} - ${data.statistic.heightUp} cm',
                  ),
                  buildTableRow(
                    'pH',
                    '${data.statistic.phLow} - ${data.statistic.phUp}',
                  ),
                  buildTableRow(
                    'Spacing',
                    '${data.statistic.spacingLow} - ${data.statistic.spacingUp} cm',
                  ),
                  buildTableRow(
                    'Temperature',
                    '${data.statistic.temperatureLow}ºC - ${data.statistic.temperatureUp}ºC',
                  ),
                  buildTableRow(
                    'Width',
                    '${data.statistic.widthLow} - ${data.statistic.widthUp} cm',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TableRow buildTableRow(String text, String text2) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 14,
              color: MyColors.grey,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            text2,
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 14,
              color: MyColors.darkGrey,
            ),
          ),
        )
      ],
    );
  }
}
