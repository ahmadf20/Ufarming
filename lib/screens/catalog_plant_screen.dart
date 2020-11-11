import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ufarming/screens/catalog_detail_screen.dart';
import 'package:ufarming/utils/my_colors.dart';
import 'package:ufarming/utils/my_text_field.dart';
import 'package:ufarming/widgets/my_app_bar.dart';

class CatalogPlantScreen extends StatelessWidget {
  const CatalogPlantScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                suffix: Icon(
                  Icons.search,
                  color: MyColors.grey,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                padding: EdgeInsets.fromLTRB(25, 30, 25, 35),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return _CardItem();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CardItem extends StatelessWidget {
  const _CardItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(CatalogDetailScreen()),
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
            Center(child: Image.asset('assets/images/tomato.png')),
            Text(
              'Tomato',
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
                  'Hydroponic',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: MyColors.grey,
                  ),
                ),
                Spacer(),
                Text(
                  'Hard',
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
