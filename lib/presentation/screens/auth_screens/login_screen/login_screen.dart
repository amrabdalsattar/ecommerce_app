import 'package:ecommerce_app/domain/di/di.dart';
import 'package:ecommerce_app/presentation/screens/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/dialog_utils.dart';
import '../../../shared_components/custom_auth_button.dart';
import '../../../shared_components/custom_text_field.dart';
import '../../../shared_components/route_logo.dart';
import '../../../view_model/auth_view_models/login_view_model.dart';
import '../../../view_model/states/base_states.dart';
import '../register_screen/register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "loginScreen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginViewModel viewModel = getIt();

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.primary,
        systemNavigationBarDividerColor: AppColors.primary,
        systemNavigationBarContrastEnforced: true,
        systemNavigationBarIconBrightness: Brightness.light));
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocListener(
            listener: (_, state) {
              switch (state) {
                case BaseLoadingState():
                  showLoading(context);

                case BaseErrorState():
                  Navigator.pop(context);
                  showSnackBar(context, state.errorMessage, AppColors.red);

                case BaseSuccessState():
                  Navigator.pop(context);
                  showSnackBar(context, "Welcome Back!", AppColors.green);
                  Navigator.pushReplacementNamed(context, MainScreen.routeName);
              }
            },
            bloc: viewModel,
            child: Form(
              key: viewModel.formKey,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 13.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const RouteLogo(),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Welcome Back To Route",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                      "Please Sign in with your mail",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 2),
                    CustomTextField(
                      validator: (email) {
                        if (email == null || email.isEmpty) {
                          return "Email is Required";
                        }
                        if (!RegExp(
                          r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
                        ).hasMatch(email)) {
                          return "Please Enter a valid Email";
                        }
                        return null;
                      },
                      label: "Email",
                      controller: viewModel.email,
                      hintText: "Enter your Email",
                      isPassword: false,
                      textInputType: TextInputType.emailAddress,
                    ),
                    CustomTextField(
                        validator: (password) {
                          if (password == null || password.isEmpty) {
                            return "Password is Required";
                          }
                          if (password.length < 6) {
                            return "This isn't a Valid Password";
                          }
                          return null;
                        },
                        label: "Password",
                        controller: viewModel.password,
                        hintText: "Enter your Password",
                        isPassword: true,
                        textInputType: TextInputType.visiblePassword,
                        isObscure: isObscure,
                        icon: togglePasswordVisibility()),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text("Forgot Password",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(fontWeight: FontWeight.w100)),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.04,
                    ),
                    CustomAuthButton(
                      onPressed: () {
                        viewModel.login();
                      },
                      title: "Login",
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.005,
                    ),
                    Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an Account?",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RegisterScreen.routeName);
                            },
                            child: Text(
                              "Create Account",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ))
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget togglePasswordVisibility() {
    return IconButton(
        splashColor: Colors.transparent,
        color: AppColors.grey,
        onPressed: () {
          isObscure = !isObscure;
          setState(() {});
        },
        icon: isObscure
            ? const Icon(Icons.visibility_off)
            : const Icon(Icons.visibility));
  }
}
