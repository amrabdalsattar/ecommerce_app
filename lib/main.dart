import 'package:ecommerce_app/domain/di/di.dart';
import 'package:ecommerce_app/presentation/screens/auth_screens/login_screen/login_screen.dart';
import 'package:ecommerce_app/presentation/screens/auth_screens/register_screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'data/data_utils/cache_helper.dart';
import 'utils/app_themes.dart';

void main() {
  CacheData.cacheInitialization();
  configureDependencies();
  runApp(const ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        routes: {
          RegisterScreen.routeName: (_) => const RegisterScreen(),
          LoginScreen.routeName: (_) => const LoginScreen(),
        },
        theme: AppThemes.lightTheme,
        debugShowCheckedModeBanner: false,
        title: 'E-commerce App',
        home: const LoginScreen(),
      ),
    );
  }
}
