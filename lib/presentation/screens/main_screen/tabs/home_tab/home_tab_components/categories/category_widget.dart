import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/data/models/responses/home_responses/categories_response.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryDM categoryDM;

  const CategoryWidget({super.key, required this.categoryDM});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 45,
          backgroundImage: CachedNetworkImageProvider(categoryDM.image ?? ''),
        ),
        SizedBox(height: 10.h,),
        SizedBox(
            child: Center(
                child: Text(
              categoryDM.name ?? "Unknown",
              textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.primary),
            )))
      ],
    );
  }
}
