import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

class MethodsButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget body;

  const MethodsButton({super.key, this.onPressed, required this.body});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
            fixedSize: WidgetStatePropertyAll(Size(220.w, 20.h)),
            backgroundColor: const WidgetStatePropertyAll(AppColors.primary)),
        child: body);
  }
}
