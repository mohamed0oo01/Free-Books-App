import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CoustomListViewItem extends StatelessWidget {
  const CoustomListViewItem({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(16),
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imageUrl,
          errorWidget: (context, url, error) => Icon(Icons.error_outline),
          // placeholder: (context, url) => const Center(child: CircularProgressIndicator(),)
          )
      ),
    );
  }
}
