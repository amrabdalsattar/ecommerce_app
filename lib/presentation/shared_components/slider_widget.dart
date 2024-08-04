import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/presentation/view_model/product_view_models/product_details_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/app_colors.dart';
import 'loading_widget.dart';

class SliderWidget extends StatelessWidget {
  final List<String> images;
  final ProductDetailsViewModel viewModel;
  final bool isLocalImages;

  const SliderWidget(
      {super.key,
      required this.images,
      required this.viewModel,
      this.isLocalImages = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.liteBlue),
          borderRadius: BorderRadius.circular(20)),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(19),
            child: CarouselSlider(
                items: images
                    .map((url) => isLocalImages
                        ? Image.asset(
                            url,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.fill,
                          )
                        : CachedNetworkImage(
                            imageUrl: url,
                            placeholder: (_, __) => const LoadingWidget(),
                            errorWidget: (_, __, ___) =>
                                const Icon(Icons.error),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            fit: BoxFit.fitWidth,
                          ))
                    .toList(),
                options: CarouselOptions(
                  initialPage: 0,
                  viewportFraction: 1,
                  autoPlay: true,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    viewModel.changeSliderIndex(index);
                  },
                )),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10.h),
            child: AnimatedSmoothIndicator(
              activeIndex: viewModel.currentSliderIndex,
              count: images.length,
              effect: ExpandingDotsEffect(
                  expansionFactor: 4.5.w,
                  activeDotColor: AppColors.primary,
                  dotColor: AppColors.liteGrey,
                  dotHeight: 6.h,
                  dotWidth: 6.w,
                  paintStyle: PaintingStyle.fill),
            ),
          )
        ],
      ),
    );
  }
}
