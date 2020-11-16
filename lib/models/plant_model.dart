import 'dart:convert';

List<Plant> plantsFromJson(String str) =>
    List<Plant>.from(json.decode(str).map((x) => Plant.fromJson(x)));

Plant plantFromJson(String str) => Plant.fromJson(json.decode(str));

class Plant {
  Plant({
    this.id,
    this.plantName,
    this.summary,
    this.growing,
    this.harvesting,
    this.picture,
    this.createdAt,
    this.updatedAt,
    this.difficulty,
    this.categoryId,
    this.typeId,
    this.stages,
    this.totalDays,
    this.successRate,
    this.categoryName,
    this.typeName,
  });

  String id;
  String plantName;
  String summary;
  String growing;
  String harvesting;
  String picture;
  DateTime createdAt;
  DateTime updatedAt;
  String difficulty;
  String categoryId;
  String typeId;
  String stages;
  String totalDays;
  String successRate;
  String categoryName;
  String typeName;

  factory Plant.fromJson(Map<String, dynamic> json) => Plant(
        id: json["id"],
        plantName: json["plant_name"],
        summary: json["summary"],
        growing: json["growing"],
        harvesting: json["harvesting"],
        picture: json["picture"],
        difficulty: json["difficulty"],
        categoryId: json["category_id"],
        typeId: json["type_id"],
        stages: json["stages"],
        totalDays: json["total_days"],
        successRate: json["success_rate"],
        categoryName: json["category_name"],
        typeName: json["type_name"],
      );
}
