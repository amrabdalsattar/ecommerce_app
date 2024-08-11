
import '../products_responses/products_response.dart';

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
        data?.add(ProductDM.fromJson(v));
      });
    }
  }
  String? status;
  int? count;
  List<ProductDM>? data;

}


