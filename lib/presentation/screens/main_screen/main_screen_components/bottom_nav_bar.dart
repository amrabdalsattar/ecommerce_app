import 'package:ecommerce_app/presentation/view_model/main_view_model/main_screen_view_model.dart';
import 'package:ecommerce_app/utils/app_assets.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final MainScreenViewModel viewModel;

  const CustomBottomNavBar({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: BottomNavigationBar(
          showSelectedLabels: false,
          currentIndex: viewModel.currentIndex,
          type: BottomNavigationBarType.shifting,
          elevation: 0,
          onTap: (index) {
            viewModel.toggleCurrentTab = index;
          },
          items: [
            viewModel.buildBottomNavIcon(
                AppAssets.homeIcon, viewModel.currentIndex == 0),
            viewModel.buildBottomNavIcon(
                AppAssets.categoriesIcon, viewModel.currentIndex == 1),
            viewModel.buildBottomNavIcon(
                AppAssets.wishlistIcon, viewModel.currentIndex == 2),
            viewModel.buildBottomNavIcon(
                AppAssets.profileIcon, viewModel.currentIndex == 3),
          ]),
    );
  }
}
