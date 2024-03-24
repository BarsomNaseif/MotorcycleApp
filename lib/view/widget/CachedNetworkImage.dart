import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
class WidgetCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit? fit;
  final double? height;
  final double? width;

  WidgetCachedNetworkImage(
      {super.key, required this.imageUrl, this.fit, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit,
        height: height,
        width: width,
        errorWidget: (context, url, error) =>
            Icon(Icons.error_outline, color: Colors.grey[700]),
        placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
              strokeWidth: 1.0,
            )));
  }
}
