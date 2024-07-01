import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

abstract class AppThemes {
  static ThemeData lightTheme = ThemeData(
    canvasColor: AppColors.primary,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.primary,
    textTheme: TextTheme(
      headlineLarge: TextStyle(
          color: AppColors.white, fontSize: 18.sp, fontWeight: FontWeight.w600),
      headlineMedium: TextStyle(
          color: AppColors.white, fontSize: 13.sp, fontWeight: FontWeight.w400),
      headlineSmall: TextStyle(
          color: AppColors.white,
          fontSize: 11.5.sp,
          fontWeight: FontWeight.w100),
      bodySmall: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.normal,
          color: AppColors.primary),
    ),
  );
}
