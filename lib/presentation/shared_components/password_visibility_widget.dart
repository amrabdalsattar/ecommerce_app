import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class PasswordVisibilityWidget extends StatefulWidget {
  final bool isObscure;
  const PasswordVisibilityWidget({super.key, required this.isObscure});

  @override
  State<PasswordVisibilityWidget> createState() => _PasswordVisibilityWidgetState();
}

class _PasswordVisibilityWidgetState extends State<PasswordVisibilityWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        splashColor: Colors.transparent,
        color: AppColors.grey,
        onPressed: () {
          widget.isObscure == !widget.isObscure;
          setState(() {

          });
        },
        icon: widget.isObscure ? const Icon(Icons.visibility_off) : const Icon(
            Icons.visibility));;
  }
}
