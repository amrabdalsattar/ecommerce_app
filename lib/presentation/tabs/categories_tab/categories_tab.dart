import 'package:ecommerce_app/data/data_utils/cache_helper.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: AppColors.grey,
    child: Text(CacheData.getData(key: "name")),);
  }
}
