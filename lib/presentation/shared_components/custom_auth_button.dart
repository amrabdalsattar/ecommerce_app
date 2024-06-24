import '../../utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;

  const CustomAuthButton({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: const WidgetStatePropertyAll(AppColors.white),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)))),
          onPressed: onPressed,
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontSize: 15, color: AppColors.primary),
          )),
    );
  }
}
