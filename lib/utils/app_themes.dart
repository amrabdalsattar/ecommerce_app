import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

abstract class AppThemes {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.primary,
      surfaceTintColor: AppColors.transparent
    ),
    canvasColor: AppColors.primary,
    splashColor: AppColors.primary,
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
      bodyLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.primary),
      bodyMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          color: AppColors.primary)
    ),
  );
}
