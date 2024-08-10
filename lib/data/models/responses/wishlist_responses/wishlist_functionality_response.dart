class WishlistFunctionalityResponse {
  WishlistFunctionalityResponse({
    this.status,
    this.message,
    this.data,
  });

  WishlistFunctionalityResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }

  String? status;
  String? message;
  List<String>? data;
}
