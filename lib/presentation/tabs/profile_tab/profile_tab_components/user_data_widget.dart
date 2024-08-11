import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors.dart';

class UserDataWidget extends StatelessWidget {
  final String data;
  final String label;

  const UserDataWidget({super.key, required this.data, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 16.w, bottom: 10.h, top: 18.h),
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 40.h,
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.liteBlue)),
          child: Text(
            data,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontWeight: FontWeight.bold, fontSize: 12.sp),
          ),
        ),
      ],
    );
  }
}
