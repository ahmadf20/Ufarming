import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ufarming/controllers/article_controller.dart';
import 'package:ufarming/models/article_model.dart';
import 'package:ufarming/screens/aricticles_detail_screen.dart';
import 'package:ufarming/utils/my_colors.dart';
import 'package:ufarming/widgets/load_image.dart';
import 'package:ufarming/widgets/loading_indicator.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<ArticleController>(
      init: ArticleController(),
      builder: (s) {
        return Scaffold(
          body: s.isLoading.value
              ? loadingIndicator()
              : ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 35, 25, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Learning',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'The more you read, the more you know~',
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
                    SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 25),
                            ...s.articles.sublist(0, 3).map((item) {
                              return _LatestPostCard(
                                data: item,
                              );
                            }).toList(),
                          ]),
                    ),
                    SizedBox(height: 55),
                    ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                      children: [
                        ...s.articles.sublist(3).map((item) {
                          return _PostCard(data: item);
                        }).toList(),
                      ],
                    ),
                  ],
                ),
        );
      },
    );
  }
}

class _LatestPostCard extends StatelessWidget {
  final Article data;

  const _LatestPostCard({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(ArticleDetailScreen(
        data: data,
      )),
      child: Container(
        width: 225,
        margin: EdgeInsets.only(right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: loadImage(
                    data.picture,
                    isShowLoading: false,
                    height: 250,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.fromLTRB(8, 5, 5, 5),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    data.category,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 10,
                      color: MyColors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: double.maxFinite,
              child: Text(
                data.title,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16.5,
                  fontWeight: FontWeight.w700,
                ),
                maxLines: 3,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 10),
            Text(
              data.author,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  final Article data;

  const _PostCard({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(ArticleDetailScreen(
        data: data,
      )),
      child: Container(
        color: Colors.transparent,
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: loadImage(
                    data.picture,
                    isShowLoading: false,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(width: 25),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(8, 5, 5, 5),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      data.category,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 10,
                        color: MyColors.darkGrey,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.maxFinite,
                    child: Text(
                      data.title,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 3,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    data.author,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 25),
          ],
        ),
      ),
    );
  }
}
