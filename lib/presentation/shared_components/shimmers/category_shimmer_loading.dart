import 'package:ecommerce_app/presentation/shared_components/shimmers/text_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/app_colors.dart';

class CategoryShimmerLoading extends StatelessWidget {
  const CategoryShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerLiteGrey,
      highlightColor: AppColors.shimmerMidGrey,
      enabled: true,
      child: GridView.builder(
        itemCount: 10,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, int index) => const Column(
          children: [
            CircleAvatar(
              radius: 40,
            ),
            TextShimmerLoading(width: 50,)
          ],
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2, mainAxisSpacing: 16.w),
      ),
    );
  }
}
