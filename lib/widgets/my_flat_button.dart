import 'package:flutter/material.dart';
import 'package:ufarming/utils/my_colors.dart';

class MyFlatButton extends StatelessWidget {
  @required
  final String text;
  final Function onPressed;

  const MyFlatButton({
    Key key,
    @required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width,
      child: FlatButton(
        onPressed: onPressed,
        color: MyColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: MyColors.white,
          ),
        ),
      ),
    );
  }
}
