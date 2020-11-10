import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ufarming/utils/const.dart';
import 'package:ufarming/utils/custom_bot_toast.dart';
import 'package:ufarming/widgets/loading_indicator.dart';

Widget loadImage(
  String linkGambar, {
  bool isShowLoading = true,
  Alignment alignment,
  bool hasErrorWidget = true,
  Color color,
}) {
  if (linkGambar == null || linkGambar.isEmpty) {
    return Icon(Icons.error_outline);
  } else {
    try {
      Widget image = CachedNetworkImage(
        color: color,
        imageUrl: Uri.encodeFull('$linkGambar'),
        alignment: alignment ?? Alignment.center,
        placeholder: (context, url) {
          if (isShowLoading) {
            return loadingIndicator(color: Theme.of(context).accentColor);
          } else {
            return Container();
          }
        },
        errorWidget: (context, url, error) =>
            !hasErrorWidget ? Container() : Icon(Icons.error_outline),
      );
      return image;
    } catch (e) {
      customBotToastText(ErrorMessage.general);
      return Icon(Icons.error_outline);
    }
  }
}
