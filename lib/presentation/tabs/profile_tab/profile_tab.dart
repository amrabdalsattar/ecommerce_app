import 'package:ecommerce_app/data/data_utils/cache_helper.dart';
import 'package:ecommerce_app/presentation/tabs/profile_tab/profile_tab_components/user_data_widget.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Column(
          children: [
            UserDataWidget(
                data: CacheData.getData(key: "name"), label: "Your full name"),
            UserDataWidget(
                data: CacheData.getData(key: "email"), label: "Your E-mail"),
            const UserDataWidget(
                data: "********************", label: "Password"),
          ],
        )
      ],
    );
  }
}
