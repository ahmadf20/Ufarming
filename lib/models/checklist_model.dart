import 'dart:convert';

List<CheckList> checkListFromJson(String str) =>
    List<CheckList>.from(json.decode(str).map((x) => CheckList.fromJson(x)));

class CheckList {
  CheckList({
    this.id,
    this.title,
    this.isChecked,
    this.desc,
    this.idMyplant,
  });

  String id;
  String title;
  bool isChecked;
  String desc;
  String idMyplant;

  factory CheckList.fromJson(Map<String, dynamic> json) => CheckList(
        id: json["id"],
        title: json["title"],
        isChecked: json["is_checked"] is String
            ? (json["is_checked"] == '0' ? false : true)
            : json["is_checked"],
        desc: json["desc"],
        idMyplant: json["id_myplant"],
      );
}
