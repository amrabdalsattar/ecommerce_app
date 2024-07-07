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

void showToast({required String message, required Color color,Color textColor = AppColors.white}) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: color,
    fontSize: 14.sp,
    textColor: textColor,
    toastLength: Toast.LENGTH_SHORT,
  );
}

void showSnackBar(BuildContext context, String message, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.white),
    ),
    backgroundColor: color,
  ));
}
