import 'package:flutter/material.dart';

import 'app_colors.dart';

void showLoading(BuildContext context){
  showDialog(context: context,
      barrierDismissible: false,
      builder: (_){
        return Container(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.white,
              ),
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            ),
          ),
        );
      });
}