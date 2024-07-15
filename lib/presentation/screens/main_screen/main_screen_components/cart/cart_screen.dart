import 'package:ecommerce_app/presentation/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared_components/app_bars/inner_screens_app_bar.dart';

class CartScreen extends StatelessWidget {
  static const routeName = "cartScreen";
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartViewModel cartViewModel = BlocProvider.of(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: const InnerScreensAppBar(isForCartScreen: true, title: "Cart",),
      ),
      body: ListView.builder(
        itemCount: cartViewModel.cartDM?.products?.length??0,
        itemBuilder: (context, index) => const Text(""),
      ),
    );
  }
}
