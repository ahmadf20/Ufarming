import 'package:flutter/material.dart';
import 'package:ufarming/utils/my_colors.dart';
import 'package:ufarming/widgets/my_app_bar.dart';
import 'package:ufarming/widgets/my_card.dart';

class PlantInformationScreen extends StatelessWidget {
  const PlantInformationScreen({Key key}) : super(key: key);

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
          Image.asset('assets/images/tomato.png'),
          Text(
            'Spicy Parlsey',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'Spicy Parlsey',
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
            body:
                'As a high value and high demand product, basil is an extremely popular cash crop in aquaponics, It is often thought of as an ideal crop in aquaponics, due to its high uptake of nitrogen',
            showDivider: true,
            showIcon: false,
          ),
          MyCard(
            title: 'Growing',
            body:
                'Basil grows ideally within the range of 20-25C, although it can live within the wider range of 18-30*C, Particularly, under warmer conditions,such as 279C and above, additional shade will be necessary in order to prevent tip burn among your basil crops;  uch shade should be around a twenty percent reduction and increased ventilation would be ideal. \n\nTransplantion of seedlings should occur after the basil seedlings have matured to have 4 true leaves or more. Ventilation and a stable water temperatures of 21-25*C day and night aids in reduction of many commonly incurred diseases such as gray mold, Fusarium wilt, and black spot. During plant growth, the removal of flowering tips may reduce long term bitterness.',
            showDivider: true,
            showIcon: false,
          ),
          MyCard(
            title: 'Harvesting',
            body:
                'Once the basil has reached about 15cm in height, it is a good time to begin the harvesting process which can last another 4-7 weeks. Be mindful when removing and handling leaves to avoid bruising and blackening.',
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
                  buildTableRow('Germination Days', '6 - 7'),
                  buildTableRow('Germination Temperature', '20ºC - 25ºC'),
                  buildTableRow('Growth Days', '6 - 7'),
                  buildTableRow('Heigh', '30 - 70 cm'),
                  buildTableRow('pH', '6 - 7'),
                  buildTableRow('Spacing', '15 - 25 cm'),
                  buildTableRow('Temperature', '18ºC - 25ºC'),
                  buildTableRow('Width', '30 - 40 cm'),
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
