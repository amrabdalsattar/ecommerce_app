import 'package:ecommerce_app/presentation/screens/main_screen/main_screen_components/bottom_nav_bar.dart';
import 'package:ecommerce_app/presentation/view_model/main_view_model/main_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/app_colors.dart';

class MainScreen extends StatelessWidget {
  static const String routeName = "mainScreen";

  MainScreen({super.key});

  final MainScreenViewModel viewModel = MainScreenViewModel();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: AppColors.primary,
    ));
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocBuilder<MainScreenViewModel, dynamic>(
        bloc: viewModel,
        builder: (context, _) => Scaffold(
          body: viewModel.tabs[viewModel.currentIndex],
          bottomNavigationBar: CustomBottomNavBar(viewModel: viewModel,),
        ),
      ),
    );
  }
}
