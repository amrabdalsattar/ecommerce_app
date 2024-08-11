import 'package:ecommerce_app/data/models/responses/base_response.dart';

import '../categories_responses/categories_response.dart';
import '../meta_data_response.dart';

class ProductsResponse extends BaseResponse {
  ProductsResponse.fromJson(dynamic json) {
    results = json['results'];
    message = json['message'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      products = [];
      json['data'].forEach((v) {
        products?.add(ProductDM.fromJson(v));
      });
    }
  }

  int? results;
  Metadata? metadata;
  List<ProductDM>? products;
}

class ProductDM {
  ProductDM.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(Subcategory.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? ProductCategory.fromJson(json['category'])
        : null;
    brand = json['brand'];
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }

  int? sold;
  List<String>? images;
  List<Subcategory>? subcategory;
  int? ratingsQuantity;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  int? price;
  String? imageCover;
  ProductCategory? category;
  dynamic brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  String? id;

}

class ProductCategory {

  ProductCategory.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }

  String? id;
  String? name;
  String? slug;
  String? image;
}
