import 'package:flutter/foundation.dart';

List<ProductsModel> productsFromJson(List<dynamic> data) {
  return List.from(data.map<ProductsModel>((e) => ProductsModel.fromJson(e)));
}

class ProductsModel {
  int? id;
  String? title;
  int? price;
  String? description;
  Category? category;
  List<String>? images;

  ProductsModel(
      {this.id,
        this.title,
        this.price,
        this.description,
        this.category,
        this.images});

  ProductsModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['images'] = this.images;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? image;

  Category({this.id, this.name, this.image});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}
