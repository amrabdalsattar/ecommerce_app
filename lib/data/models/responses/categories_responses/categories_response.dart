import 'package:ecommerce_app/data/models/responses/base_response.dart';

import '../meta_data_response.dart';

class CategoriesResponse extends BaseResponse {

  CategoriesResponse.fromJson(dynamic json) {
    results = json['results'];
    message = json['message'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      categories = [];
      json['data'].forEach((v) {
        categories?.add(CategoryDM.fromJson(v));
      });
    }
  }

  int? results;
  Metadata? metadata;
  List<CategoryDM>? categories;
}

class CategoryDM {

  CategoryDM.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;

}

class Subcategory {

  Subcategory.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }

  String? id;
  String? name;
  String? slug;
  String? category;
}
