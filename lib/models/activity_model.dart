import 'dart:convert';

List<Activity> activityFromJson(String str) =>
    List<Activity>.from(json.decode(str).map((x) => Activity.fromJson(x)));

class Activity {
  Activity({
    this.id,
    this.title,
    this.idMyplant,
    this.createdAt,
  });

  String id;
  String title;
  String idMyplant;
  DateTime createdAt;

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        id: json["id"],
        title: json["title"],
        idMyplant: json["id_myplant"],
        createdAt: DateTime.parse(json["created_at"]),
      );
}
