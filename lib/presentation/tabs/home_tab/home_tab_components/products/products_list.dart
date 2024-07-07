import 'package:ecommerce_app/data/models/responses/products_responses/cart_response.dart';
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
        CartDM? cartDM = cartViewModel.cartDM;
        return ListView.builder(
            itemCount: products.length,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              ProductDM product = products[index];
              bool isInCart = false;
              if (cartDM != null && cartDM.products != null) {
                var productsInCart = cartDM.products!;
                for (int i = 0; i < productsInCart.length; i++) {
                  if (product.id == productsInCart[i].product?.id) {
                    isInCart = true;
                  }
                }
              }
              return ProductWidget(
                product: products[index],
                isInCart: isInCart,
                cartViewModel: cartViewModel,
              );
            });
      },
    );
  }
}
