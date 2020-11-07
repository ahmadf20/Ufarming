import 'package:flutter/material.dart';
import 'package:ufarming/utils/my_colors.dart';

class MyAppBar extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final bool centerTitle;
  final Widget leading;
  final bool showLeading;
  final List<Widget> actions;

  const MyAppBar({
    Key key,
    this.title,
    this.backgroundColor = MyColors.canvas,
    this.centerTitle = true,
    this.leading,
    this.showLeading = true,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      title: Text(
        title ?? '',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: MyColors.darkGrey,
        ),
      ),
      leading: showLeading ? leading : Container(),
      leadingWidth: showLeading ? null : 10,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      elevation: 0,
      brightness: Brightness.light,
      iconTheme: IconThemeData(
        color: MyColors.darkGrey,
      ),
      bottom: PreferredSize(
        child: Divider(
          height: 0,
          color: Colors.black.withAlpha(15),
        ),
        preferredSize: Size.fromHeight(0),
      ),
    );
  }
}
