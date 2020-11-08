import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ufarming/main.dart';

Future<void> showNotification(
  String title,
  String body, {
  String channelId,
  String channelName,
  String channelDesc,
}) async {
  AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    channelId ?? 'Message Notification',
    channelName ?? 'Message Notification',
    channelDesc ?? 'Notify user to the incoming message',
    importance: Importance.max,
    priority: Priority.high,
    visibility: NotificationVisibility.public,
    ticker: 'ticker',
  );

  NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.show(
    0,
    title,
    body,
    platformChannelSpecifics,
    payload: 'item x',
  );
}
