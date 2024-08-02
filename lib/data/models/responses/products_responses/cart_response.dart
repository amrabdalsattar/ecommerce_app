import 'package:ecommerce_app/data/models/responses/base_response.dart';

import 'products_response.dart';

class CartResponse extends BaseResponse{

  CartResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartData = json['data'] != null ? CartDM.fromJson(json['data']) : null;
  }

  String? status;
  int? numOfCartItems;
  CartDM? cartData;
}

class CartDM {

  CartDM.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(CartProduct.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }

  String? id;
  String? cartOwner;
  List<CartProduct>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  num? totalCartPrice;
}

class CartProduct {

  CartProduct.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product =
        json['product'] != null ? ProductDM.fromJson(json['product']) : null;
    price = json['price'];
  }

  num? count;
  String? id;
  ProductDM? product;
  int? price;
}


