import 'package:ecommerce_app/presentation/view_model/product_view_models/product_details_view_model.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncrementAndDecrementButton extends StatelessWidget {
  final ProductDetailsViewModel viewModel;
  const IncrementAndDecrementButton({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.w,
      height: 35.h,
      decoration: BoxDecoration(
          color: AppColors.primary, borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: (){
              viewModel.increaseNumberOfItems();
            },
            child: Container(
              width: 25.sp,
              height: 25.sp,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.white, width: 1.5),
              borderRadius: BorderRadius.circular(20)),
              child: const Icon(
                Icons.add,
                color: AppColors.white,
                size: 18,
              ),
            ),
          ),
          Text(
            "${viewModel.numberOfItems}",
            style: const TextStyle(color: AppColors.white),
          ),
          GestureDetector(
            onTap: (){
              viewModel.decreaseNumberOfItems();
            },
            child: Container(
              width: 25.sp,
              height: 25.sp,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.white, width: 1.5),
                  borderRadius: BorderRadius.circular(20)),
              child: const Icon(
                Icons.remove,
                color: AppColors.white,
                size: 18,
              ),
            ),
          )
        ],
      ),
    );
  }
}
