import 'package:flutter/material.dart';
import 'package:ufarming/utils/my_colors.dart';

Widget loadingIndicator({Color color}) {
  return Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(
        color ?? MyColors.lightGrey,
      ),
    ),
  );
}
