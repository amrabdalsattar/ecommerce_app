import 'package:ecommerce_app/presentation/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'data/data_utils/cache_helper.dart';
import 'domain/di/di.dart';
import 'presentation/screens/auth_screens/login_screen/login_screen.dart';
import 'presentation/screens/auth_screens/register_screen/register_screen.dart';
import 'presentation/screens/main_screen/main_screen.dart';
import 'utils/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheData.cacheInitialization();
  configureDependencies();
  runApp(BlocProvider(
      create: (_) => getIt<CartViewModel>(),
      child: const ECommerceApp()));
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
          MainScreen.routeName: (_) => MainScreen(),
        },
        initialRoute: CacheData.getData(key: "token") == null
            ? LoginScreen.routeName
            : MainScreen.routeName,
        theme: AppThemes.lightTheme,
        debugShowCheckedModeBanner: false,
        title: 'E-commerce App',
      ),
    );
  }
}
