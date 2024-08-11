import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_assets.dart';

class RouteLogo extends StatelessWidget {
  const RouteLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            margin:
                EdgeInsets.only(top: MediaQuery.sizeOf(context).width * 0.1),
            child: Image.asset(
              AppAssets.routeLogo,
              width: 250.w,
            )));
  }
}
