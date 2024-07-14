import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_assets.dart';
import '../../screens/main_screen/main_screen_components/custom_search_bar.dart';
import '../icons/cart_icon.dart';

class MainScreenAppBar extends StatelessWidget {
  const MainScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      snap: true,
      title: Image.asset(AppAssets.blueLogo),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Container(
          margin: EdgeInsets.only(top: 2.8.h),
          child: const Row(
            children: [
              CustomSearchBar(),
              Spacer(),
              CartIcon(size: 30)
            ],
          ),

        ),
      ),
    );
  }
}
