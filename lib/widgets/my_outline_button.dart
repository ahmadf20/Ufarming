import 'package:flutter/material.dart';
import 'package:ufarming/utils/my_colors.dart';

class MyOutlineButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const MyOutlineButton({
    Key key,
    @required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.00,
      width: MediaQuery.of(context).size.width,
      child: OutlineButton(
        borderSide: BorderSide(
          color: MyColors.primary,
          width: 1.5,
        ),
        highlightedBorderColor: MyColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: MyColors.primary,
          ),
        ),
      ),
    );
  }
}
