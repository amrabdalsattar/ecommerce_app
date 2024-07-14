import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool isPassword;
  final bool isObscure;
  final Widget? icon;

  const CustomTextField(
      {super.key,
      required this.label,
      required this.hintText,
      required this.textInputType,
      this.validator,
      required this.controller,
      required this.isPassword,
      this.isObscure = false,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Container(
            margin: EdgeInsets.only(top: 15.h),
            child: TextFormField(
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold, color: AppColors.black),
              cursorColor: AppColors.primary,
              controller: controller,
              validator: validator,
              keyboardType: textInputType,
              obscureText: isPassword ? isObscure : false,
              decoration: InputDecoration(
                suffixIcon: isPassword
                    ? icon
                    : const SizedBox(
                        width: 1,
                        height: 1,
                      ),
                hintText: hintText,
                fillColor: AppColors.white,
                filled: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                isDense: true,
                border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.primary, width: 2.0),
                    borderRadius: BorderRadius.circular(16)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(16.0)),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary, width: 1.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      16.0,
                    ),
                  ),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.red, width: 1.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      16.0,
                    ),
                  ),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary, width: 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      16.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
