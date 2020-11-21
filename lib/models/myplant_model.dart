import 'dart:convert';

List<MyPlant> myPlantFromJson(String str) =>
    List<MyPlant>.from(json.decode(str).map((x) => MyPlant.fromJson(x)));

class MyPlant {
  MyPlant({
    this.id,
    this.name,
    this.plantName,
    this.progress,
    this.picture,
    this.finishTask,
    this.totalTask,
    this.listTask,
  });

  String id;
  String name;
  String plantName;
  String progress;
  String picture;
  int finishTask;
  int totalTask;
  List<ListTask> listTask;

  factory MyPlant.fromJson(Map<String, dynamic> json) => MyPlant(
        id: json["id"],
        name: json["name"],
        plantName: json["plant_name"],
        progress: json["progress"],
        picture: json["picture"],
        finishTask: json["finish_task"],
        totalTask: json["total_task"],
        listTask: List<ListTask>.from(
            json["list_task"].map((x) => ListTask.fromJson(x))),
      );
}

class ListTask {
  ListTask({
    this.task,
    this.ischeck,
  });

  String task;
  bool ischeck;

  factory ListTask.fromJson(Map<String, dynamic> json) => ListTask(
        task: json["task"],
        ischeck: json["ischeck"],
      );
}
