import 'package:flutter/foundation.dart';

List<CategoryModel> categoryFromJson(List<dynamic> data) {
  return List.from(data.map<CategoryModel>((e) => CategoryModel.fromJson(e)));
}

class CategoryModel {
  CategoryModel({
    this.id,
    this.name,
    this.image,
  });

  CategoryModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
  int? id;
  String? name;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    return map;
  }
}
