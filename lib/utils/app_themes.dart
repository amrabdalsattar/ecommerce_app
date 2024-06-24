import 'app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: AppColors.white,
      primaryColor: AppColors.primary,
      textTheme: TextTheme(
          headlineLarge: TextStyle(
              color: AppColors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600),
          headlineMedium: TextStyle(
              color: AppColors.white,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400),
          headlineSmall: TextStyle(
              color: AppColors.white,
              fontSize: 11.5.sp,
              fontWeight: FontWeight.w100),
        bodySmall: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w100),
      )
  );
}
