import 'package:ecommerce_app/data/models/responses/products_responses/brand_response.dart';

import '../categories_responses/categories_response.dart';

class WishlistResponse {
  WishlistResponse({
      this.status, 
      this.count, 
      this.data,});

  WishlistResponse.fromJson(dynamic json) {
    status = json['status'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(WishlistItem.fromJson(v));
      });
    }
  }
  String? status;
  int? count;
  List<WishlistItem>? data;

}

class WishlistItem {
  WishlistItem({
      this.sold, 
      this.images, 
      this.subcategory, 
      this.ratingsQuantity,
      this.title, 
      this.slug, 
      this.description, 
      this.quantity, 
      this.price, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.id,});

  WishlistItem.fromJson(dynamic json) {
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
    category = json['category'] != null ? CategoryDM.fromJson(json['category']) : null;
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    id = json['id'];
  }
  int? sold;
  List<String>? images;
  List<Subcategory>? subcategory;
  int? ratingsQuantity;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  String? imageCover;
  CategoryDM? category;
  Brand? brand;
  double? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? id;

}
