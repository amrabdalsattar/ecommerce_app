import 'package:ecommerce_app/presentation/screens/main_screen/main_screen_components/bottom_nav_bar.dart';
import 'package:ecommerce_app/presentation/shared_components/app_bars/main_screen_app_bar.dart';
import 'package:ecommerce_app/presentation/view_model/main_view_model/main_screen_view_model.dart';
import 'package:ecommerce_app/presentation/view_model/wishlist_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/app_colors.dart';
import '../../view_model/cart_view_model.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = "mainScreen";

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final MainScreenViewModel viewModel = MainScreenViewModel();

  @override
  void initState() {
    super.initState();
    var cartViewModel = context.read<CartViewModel>();
    var wishlistViewModel = context.read<WishlistViewModel>();
    cartViewModel.getCartList();
    wishlistViewModel.getWishlistItems();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.primary,
        systemNavigationBarDividerColor: AppColors.primary,
        systemNavigationBarContrastEnforced: true,
        systemNavigationBarIconBrightness: Brightness.light));
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocBuilder<MainScreenViewModel, dynamic>(
        bloc: viewModel,
        builder: (context, _) => Scaffold(
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (_, innerBoxIsScrolled) => [
              MainScreenAppBar(
                currentTabIndex: viewModel.currentIndex,
              )
            ],
            body: viewModel.tabs[viewModel.currentIndex],
          ),
          bottomNavigationBar: CustomBottomNavBar(
            viewModel: viewModel,
          ),
        ),
      ),
    );
  }
}
