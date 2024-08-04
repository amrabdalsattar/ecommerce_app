import 'package:ecommerce_app/presentation/screens/main_screen/main_screen_components/bottom_nav_bar.dart';
import 'package:ecommerce_app/presentation/shared_components/app_bars/main_screen_app_bar.dart';
import 'package:ecommerce_app/presentation/view_model/main_view_model/main_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    cartViewModel.getCartList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocBuilder<MainScreenViewModel, dynamic>(
        bloc: viewModel,
        builder: (context, _) =>
            Scaffold(
              body: NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder: (_, innerBoxIsScrolled) =>
                [const MainScreenAppBar()],
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
