import 'package:ecommerce_app/data/data_utils/cache_helper.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/utils/ui_logic_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_assets.dart';
import '../../screens/main_screen/main_screen_components/custom_search_bar.dart';
import '../icons/cart_icon.dart';

class MainScreenAppBar extends StatelessWidget {
  final int currentTabIndex;

  const MainScreenAppBar({super.key, required this.currentTabIndex});

  @override
  Widget build(BuildContext context) {
    return SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      sliver: SliverSafeArea(
        top: false,
        sliver: SliverAppBar(
          pinned: true,
          floating: true,
          title: Image.asset(AppAssets.blueLogo),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(42.9.h),
            child: Container(
              margin: EdgeInsets.only(top: 2.8.h),
              child: currentTabIndex == 3
                  ? Container(
                      margin: EdgeInsets.only(left: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Welcome, ${getFirstName(CacheData.getData(key: "name"))}",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            "${CacheData.getData(key: "email")}",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: AppColors.litePrimary),
                          ),
                        ],
                      ),
                    )
                  : const Row(
                      children: [
                        CustomSearchBar(),
                        Spacer(),
                        CartIcon(size: 30)
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
