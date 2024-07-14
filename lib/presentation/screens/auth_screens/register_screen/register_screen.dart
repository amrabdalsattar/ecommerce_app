import 'package:ecommerce_app/domain/di/di.dart';
import 'package:ecommerce_app/presentation/screens/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/dialog_utils.dart';
import '../../../shared_components/buttons/custom_auth_button.dart';
import '../../../shared_components/custom_text_field.dart';
import '../../../shared_components/route_logo.dart';
import '../../../view_model/auth_view_models/register_view_model.dart';
import '../../../view_model/states/base_states.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName = "registerScreen";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterViewModel viewModel = getIt();

  bool passwordObscurity = true;
  bool rePasswordObscurity = true;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.primary));
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
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.errorMessage),
                    backgroundColor: Colors.red,
                  ));

                case BaseSuccessState():
                  Navigator.pop(context);
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
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomTextField(
                      validator: (name) {
                        if (name == null || name.isEmpty) {
                          return "Name is Required";
                        }
                        if (!RegExp(r"[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$")
                                .hasMatch(name) ||
                            !name.contains(" ")) {
                          return "Please Enter your Full Name";
                        }
                        return null;
                      },
                      label: "Full Name",
                      controller: viewModel.name,
                      hintText: "Enter your full Name",
                      isPassword: false,
                      textInputType: TextInputType.name,
                    ),
                    CustomTextField(
                      validator: (phoneNumber) {
                        if (phoneNumber == null || phoneNumber.isEmpty) {
                          return "Mobile Number is Required";
                        }
                        if (phoneNumber.length < 11) {
                          return "Please Enter a valid Mobile Number";
                        }
                        return null;
                      },
                      label: "Mobile Number",
                      controller: viewModel.phone,
                      hintText: "Enter your Mobile no.",
                      isPassword: false,
                      textInputType: TextInputType.phone,
                    ),
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
                      label: "E-mail Address",
                      controller: viewModel.email,
                      hintText: "Enter your Email Address",
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
                        isObscure: passwordObscurity,
                        icon: togglePasswordVisibility()),
                    CustomTextField(
                        validator: (rePassword) {
                          if (rePassword == null || rePassword.isEmpty) {
                            return "Please Re-Enter your Password";
                          }
                          if (rePassword != viewModel.password.text) {
                            return "Doesn't Matching the Password";
                          }
                          return null;
                        },
                        label: "Confirm your Password",
                        controller: viewModel.rePassword,
                        hintText: "Re-Enter your Password",
                        isPassword: true,
                        textInputType: TextInputType.visiblePassword,
                        isObscure: rePasswordObscurity,
                        icon: toggleRePasswordVisibility()),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.06,
                    ),
                    CustomAuthButton(
                      onPressed: () {
                        viewModel.register();
                      },
                      title: "Register",
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.1,
                    ),
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
          passwordObscurity = !passwordObscurity;
          setState(() {});
        },
        icon: passwordObscurity
            ? const Icon(Icons.visibility_off)
            : const Icon(Icons.visibility));
  }

  Widget toggleRePasswordVisibility() {
    return IconButton(
        splashColor: Colors.transparent,
        color: AppColors.grey,
        onPressed: () {
          rePasswordObscurity = !rePasswordObscurity;
          setState(() {});
        },
        icon: rePasswordObscurity
            ? const Icon(Icons.visibility_off)
            : const Icon(Icons.visibility));
  }
}
