import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ufarming/controllers/catalog_controller.dart';
import 'package:ufarming/models/plant_model.dart';
import 'package:ufarming/screens/plant/catalog_plant_detail_screen.dart';
import 'package:ufarming/utils/my_colors.dart';
import 'package:ufarming/utils/my_text_field.dart';
import 'package:ufarming/widgets/load_image.dart';
import 'package:ufarming/widgets/loading_indicator.dart';
import 'package:ufarming/widgets/my_app_bar.dart';

class CatalogPlantScreen extends StatelessWidget {
  const CatalogPlantScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<CatalogControlller>(
      init: CatalogControlller(),
      builder: (s) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: MyAppBar(
              title: 'Discover Plant',
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: MyTextField(
                    hintText: 'Search ...',
                    controller: s.searchTC,
                    onChanged: (v) {
                      s.updateQuery(v);
                    },
                    suffix: Icon(
                      Icons.search,
                      color: MyColors.grey,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Expanded(
                  child: s.isLoading.value
                      ? loadingIndicator()
                      : GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.85,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                          ),
                          padding: EdgeInsets.fromLTRB(25, 15, 25, 35),
                          itemCount: s.plantList.length,
                          itemBuilder: (context, index) {
                            return _CardItem(plant: s.plantList[index]);
                          },
                        ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class _CardItem extends StatelessWidget {
  final Plant plant;

  const _CardItem({Key key, this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(CatalogDetailScreen(
        id: plant.id,
      )),
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(15),
              blurRadius: 35,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: loadImage(
                plant.picture,
                height: 110,
              ),
            ),
            SizedBox(height: 20),
            Text(
              plant.plantName,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Text(
                  plant.categoryName,
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: MyColors.grey,
                  ),
                ),
                Spacer(),
                Text(
                  plant.difficulty,
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: MyColors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
