import 'package:ecommerce_app/presentation/screens/main_screen/main_screen_components/bottom_nav_bar.dart';
import 'package:ecommerce_app/presentation/screens/main_screen/main_screen_components/custom_search_bar.dart';
import 'package:ecommerce_app/presentation/view_model/main_view_model/main_screen_view_model.dart';
import 'package:ecommerce_app/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MainScreen extends StatelessWidget {
  static const String routeName = "mainScreen";

  MainScreen({super.key});

  final MainScreenViewModel viewModel = MainScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocBuilder<MainScreenViewModel, dynamic>(
        bloc: viewModel,
        builder: (context, _) => Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) => [
              SliverAppBar(
                pinned: true,
                floating: true,
                snap: true,
                title: Image.asset(AppAssets.blueLogo),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(50),
                  child: Container(
                    margin: EdgeInsets.only(top: 2.8.h),
                    child: Row(
                      children: [
                        const CustomSearchBar(),
                        const Spacer(),
                        Container(
                            margin: EdgeInsets.only(right: 25.w),
                            child: Image.asset(AppAssets.cartIcon))
                      ],
                    ),
                  ),
                ),
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
