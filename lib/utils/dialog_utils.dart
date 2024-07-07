import 'package:ecommerce_app/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'app_colors.dart';

void showLoading(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: AppColors.transparent,
      builder: (_) {
        return Container(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.white,
              ),
              child: const CircularProgressIndicator(
                color: AppColors.primary,
              ),
            ),
          ),
        );
      });
}

// void showToast(String message, Color color) {
//   Fluttertoast.showToast(
//     msg: message,
//     gravity: ToastGravity.BOTTOM,
//     backgroundColor: color,
//     fontSize: 10.sp,
//     toastLength: Toast.LENGTH_SHORT,
//     timeInSecForIosWeb: 1,
//   );
// }

void showSnackBar(BuildContext context, String message, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: Theme.of(context).textTheme.bodySmall,
    ),
    backgroundColor: color,
  ));
}
