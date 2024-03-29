class ModelsModel {
  final String id;
  final int created;
  final String root;

  ModelsModel({required this.id, required this.created, required this.root});

  factory ModelsModel.fromJson(Map<String, dynamic> json) =>
      ModelsModel(id: json["id"], created: json["created"], root: json["root"]);

  static List<ModelsModel> modelsFromSnapshot(List modelSnapShot) {
    return modelSnapShot.map((data) => ModelsModel.fromJson(data)).toList();
  }
}
