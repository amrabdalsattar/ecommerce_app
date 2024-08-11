import 'package:ecommerce_app/presentation/shared_components/shimmers/text_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/app_colors.dart';

class ProductShimmerLoading extends StatelessWidget {
  const ProductShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: AppColors.shimmerLiteGrey,
        highlightColor: AppColors.shimmerMidGrey,
        enabled: true,
        child: ListView.builder(
          itemCount: 10,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            width: MediaQuery.sizeOf(context).width * 0.44,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.liteBlue, width: 1.5),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 7,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                ),
                Expanded(
                    flex: 6,
                    child: Container(
                      margin: EdgeInsets.only(left: 5.w, right: 5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextShimmerLoading(
                            width: MediaQuery.of(context).size.width,
                          ),
                          const TextShimmerLoading(
                            width: 70,
                          ),
                          const TextShimmerLoading(
                            width: 50,
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
