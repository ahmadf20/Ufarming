import 'dart:convert';

import 'plant_model.dart';

PlantDetail plantDetailFromJson(String str) =>
    PlantDetail.fromJson(json.decode(str));

class PlantDetail {
  PlantDetail({
    this.plant,
    this.article,
    this.statistic,
  });

  Plant plant;
  Article article;
  Statistic statistic;

  factory PlantDetail.fromJson(Map<String, dynamic> json) => PlantDetail(
        plant: Plant.fromJson(json["plant"]),
        article: Article.fromJson(json["article"]),
        statistic: Statistic.fromJson(json["statistic"]),
      );
}

class Article {
  Article({
    this.title,
    this.picture,
    this.category,
    this.author,
    this.timestamp,
    this.description,
  });

  String title;
  String picture;
  String category;
  String author;
  DateTime timestamp;
  String description;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        title: json["title"],
        picture: json["picture"],
        category: json["category"],
        author: json["author"],
        timestamp: DateTime.parse(json["timestamp"]),
        description: json["description"],
      );
}

class Statistic {
  Statistic({
    this.germDaysLow,
    this.germDaysUp,
    this.germTemperatureLow,
    this.germTemperatureUp,
    this.growthDaysLow,
    this.growthDaysUp,
    this.heightLow,
    this.heightUp,
    this.phLow,
    this.phUp,
    this.spacingLow,
    this.spacingUp,
    this.temperatureLow,
    this.temperatureUp,
    this.widthLow,
    this.widthUp,
  });

  int germDaysLow;
  int germDaysUp;
  int germTemperatureLow;
  int germTemperatureUp;
  int growthDaysLow;
  int growthDaysUp;
  int heightLow;
  int heightUp;
  int phLow;
  int phUp;
  int spacingLow;
  int spacingUp;
  int temperatureLow;
  int temperatureUp;
  int widthLow;
  int widthUp;

  factory Statistic.fromJson(Map<String, dynamic> json) => Statistic(
        germDaysLow: json["germ_days_low"],
        germDaysUp: json["germ_days_up"],
        germTemperatureLow: json["germ_temperature_low"],
        germTemperatureUp: json["germ_temperature_up"],
        growthDaysLow: json["growth_days_low"],
        growthDaysUp: json["growth_days_up"],
        heightLow: json["height_low"],
        heightUp: json["height_up"],
        phLow: json["ph_low"],
        phUp: json["ph_up"],
        spacingLow: json["spacing_low"],
        spacingUp: json["spacing_up"],
        temperatureLow: json["temperature_low"],
        temperatureUp: json["temperature_up"],
        widthLow: json["width_low"],
        widthUp: json["width_up"],
      );
}
