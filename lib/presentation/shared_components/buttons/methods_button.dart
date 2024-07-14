import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

class MethodsButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final IconData icon;

  const MethodsButton(
      {super.key, this.onPressed, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
            )
            ),
            fixedSize: WidgetStatePropertyAll(Size(220.w, 20.h)),
            backgroundColor: const WidgetStatePropertyAll(AppColors.primary)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              color: AppColors.white,
            ),
            Text(
              title,
              style: const TextStyle(color: AppColors.white),
            )
          ],
        ));
  }
}
