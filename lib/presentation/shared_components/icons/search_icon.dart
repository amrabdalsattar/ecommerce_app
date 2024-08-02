import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_assets.dart';

class SearchIcon extends StatelessWidget {
  final double size;

  const SearchIcon({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 6.w),
        child: Image.asset(
          AppAssets.searchIcon,
          height: size.h,
        ));
  }
}
