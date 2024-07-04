import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../tabs/categories_tab/categories_tab.dart';
import '../../tabs/favourites_tab/favourites_tab.dart';
import '../../tabs/home_tab/home_tab.dart';
import '../../tabs/profile_tab/profile_tab.dart';

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
          radius: 18.sp,
          backgroundColor: AppColors.white,
          child: ImageIcon(
            AssetImage(asset),
            size: 18.sp,
            color: AppColors.primary,
          ),
        )
            : ImageIcon(AssetImage(asset), size: 18.sp, color: AppColors.white,), label: ""
    );
  }

}
class MainInitialState{}