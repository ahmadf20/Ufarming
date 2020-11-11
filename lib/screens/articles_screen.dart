import 'package:flutter/material.dart';
import 'package:ufarming/utils/my_colors.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 60, 25, 0),
        child: Column(
          children: [
            Column(
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
                  'Never stop Learning!',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 14,
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
