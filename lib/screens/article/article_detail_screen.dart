import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:intl/intl.dart';
import 'package:ufarming/models/article_model.dart';
import 'package:ufarming/utils/my_colors.dart';
import 'package:ufarming/widgets/load_image.dart';
import 'package:ufarming/widgets/my_app_bar.dart';

class ArticleDetailScreen extends StatelessWidget {
  final Article data;

  ArticleDetailScreen({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: MyAppBar(
          title: data.title,
        ),
      ),
      body: ListView(
        children: <Widget>[
          loadImage(
            data.picture,
            isShowLoading: false,
            height: 250,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 25, 15, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      data.category,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12,
                        color: MyColors.darkGrey,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                  child: Text(
                    data.title,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 15, 0, 0),
                  child: Text(
                    '${data.author} • ${DateFormat('d MMMM yyyy').format(data.updatedAt)}',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      color: MyColors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Divider(
                  height: 15,
                  indent: 10,
                  endIndent: 10,
                ),
                Html(
                  data: '''${data.description}''',
                  style: {
                    "*": Style(
                      fontFamily: 'OpenSans',
                      fontSize: FontSize.medium,
                      color: MyColors.darkGrey,
                    ),
                    "p": Style(
                      fontFamily: 'OpenSans',
                      fontSize: FontSize.medium,
                      color: MyColors.darkGrey,
                    ),
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
