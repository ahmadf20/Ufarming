import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ufarming/screens/catalog_plant_screen.dart';
import 'package:ufarming/utils/my_colors.dart';

class MyPlantsScreen extends StatelessWidget {
  const MyPlantsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 60, 25, 0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Plants',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Check how your crops are doing',
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: MyColors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  child: FlatButton(
                    color: MyColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.zero,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 25,
                    ),
                    onPressed: () => Get.to(CatalogPlantScreen()),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
