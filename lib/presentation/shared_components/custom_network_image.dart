import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'loading_widget.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  const CustomNetworkImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (_, __) => const LoadingWidget(),
      errorWidget: (_, __, ___) => const Icon(Icons.error),
      fit: BoxFit.cover,
      width: MediaQuery.sizeOf(context).width,
    );
  }
}
