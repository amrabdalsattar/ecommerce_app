import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce_app/data/repos/auth_repo_impl.dart';
import 'package:ecommerce_app/domain/use_cases/login_use_case.dart';
import 'package:ecommerce_app/presentation/auth_screens/register_screen/register_screen.dart';
import 'package:ecommerce_app/presentation/shared_components/custom_auth_button.dart';
import 'package:ecommerce_app/presentation/shared_components/custom_text_field.dart';
import 'package:ecommerce_app/presentation/shared_components/route_logo.dart';
import 'package:ecommerce_app/presentation/view_model/auth_view_models/login_view_model.dart';
import 'package:ecommerce_app/presentation/view_model/base_states.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/dialog_utils.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  LoginViewModel viewModel = LoginViewModel(
      LoginUseCase(AuthRepoImpl(Connectivity())));
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.light));
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocListener(
            listener: (_, state) {
              switch(state) {
                case BaseLoadingState() :
                  showLoading(context);

                case BaseErrorState() :
                  Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.errorMessage),
                  backgroundColor: Colors.red,
                ));

                case BaseSuccessState() :
                  Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Signed in Successfully"),
                  backgroundColor: Colors.green,
                ));
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
                      height: 50.h,
                    ),
                    Text(
                      "Welcome Back To Route",
                      style: Theme
                          .of(context)
                          .textTheme
                          .headlineLarge,
                    ),
                    Text(
                      "Please Sign in with your mail",
                      style: Theme
                          .of(context)
                          .textTheme
                          .headlineSmall,
                    ),
                    SizedBox(height: 2.h),
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
                      validator: (password){
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
                        icon: togglePasswordVisibility()
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text("Forgot Password",
                            style: Theme
                                .of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(fontWeight: FontWeight.w100)),
                      ),
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.04,),
                    CustomAuthButton(
                      onPressed: (){
                        viewModel.login();
                      },
                      title: "Login",
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.005,),
                    Center(child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an Account?",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, RegisterScreen.routeName);
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
          setState(() {

          });
        },
        icon: isObscure ? const Icon(Icons.visibility_off) : const Icon(
            Icons.visibility));
  }
}
