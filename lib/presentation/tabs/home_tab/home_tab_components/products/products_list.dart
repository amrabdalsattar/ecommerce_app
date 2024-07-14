import 'package:ecommerce_app/presentation/tabs/home_tab/home_tab_components/products/product_widget.dart';
import 'package:ecommerce_app/presentation/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/models/responses/products_responses/products_response.dart';

class ProductsList extends StatelessWidget {
  final List<ProductDM> products;

  const ProductsList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    CartViewModel cartViewModel = BlocProvider.of(context, listen: false);
    return BlocBuilder<CartViewModel, CartState>(
      builder: (context, state) {
        return ListView.builder(
            itemCount: products.length,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              ProductDM product = products[index];
              return ProductWidget(
                product: products[index],
                isInCart: cartViewModel.isInCart(product),
                cartViewModel: cartViewModel,
                heroTag: product.id!,
              );
            });
      },
    );
  }
}
