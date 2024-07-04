import 'package:ecommerce_app/presentation/tabs/home_tab/home_tab_components/products/product_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../data/models/responses/home_responses/products_response.dart';

class ProductsList extends StatelessWidget {
  final List<Product> products;

  const ProductsList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => ProductWidget(product: products[index]));
  }
}
