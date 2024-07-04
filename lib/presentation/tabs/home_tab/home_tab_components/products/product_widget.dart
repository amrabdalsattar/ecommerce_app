import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/data/models/responses/home_responses/products_response.dart';
import 'package:ecommerce_app/presentation/shared_components/loading_widget.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_assets.dart';

class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 14.w),
      width: MediaQuery.sizeOf(context).width * 0.40,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.liteBlue),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 7,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  CachedNetworkImage(
                    imageUrl: product.imageCover!,
                    placeholder: (_, __) => const LoadingWidget(),
                    errorWidget: (_, __, ___) => const Icon(Icons.error),
                    fit: BoxFit.cover,
                    width: MediaQuery.sizeOf(context).width,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Image.asset(
                      AppAssets.favouritesIcon,
                      filterQuality: FilterQuality.high,
                      color: AppColors.primary,
                      height: 15.h,
                      width: 15.w,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    product.title ?? "",
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Review (${product.ratingsAverage ?? 0})",
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(width: 5.w,),
                          Image.asset(AppAssets.star)
                        ],
                      ),
                      SizedBox(height: 2.h,),
                      Row(
                        children: [
                          Text("EGP ${product.price ?? 0}", textAlign: TextAlign.start,),
                          const Spacer(),
                          SizedBox(
                            width: 34.w,
                            height: 31.h,
                            child: FloatingActionButton(
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none
                              ),
                              onPressed: () {},
                              backgroundColor: AppColors.primary,
                              child: const Icon(Icons.add, color: AppColors.white,),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
