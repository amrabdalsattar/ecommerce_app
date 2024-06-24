import 'package:ecommerce_app/presentation/screens/main_screen/tabs/categories_tab/categories_tab.dart';
import 'package:ecommerce_app/presentation/screens/main_screen/tabs/favourites_tab/favourites_tab.dart';
import 'package:ecommerce_app/presentation/screens/main_screen/tabs/home_tab/home_tab.dart';
import 'package:ecommerce_app/presentation/screens/main_screen/tabs/profile_tab/profile_tab.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreenViewModel extends Cubit{
  MainScreenViewModel() : super(MainInitialState());
  List<Widget> tabs = const [
    HomeTab(),
    CategoriesTab(),
    FavouritesTab(),
    ProfileTab()
  ];
  int currentIndex = 0;

  set toggleCurrentTab(int index){
    currentIndex = index;
    emit(index);
  }

  buildBottomNavIcon(String asset, bool selected){
    return BottomNavigationBarItem(
        icon: selected ? CircleAvatar(
          radius: 20,
          backgroundColor: AppColors.white,
          child: ImageIcon(
            AssetImage(asset),
            size: 20.sp,
            color: AppColors.primary,
          ),
        )
            : ImageIcon(AssetImage(asset), size: 20.sp, color: AppColors.white,), label: ""
    );
  }

}
class MainInitialState{}