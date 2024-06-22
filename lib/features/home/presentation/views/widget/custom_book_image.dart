import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBookImage extends StatelessWidget {
  final String imageUrl;
  const CustomBookImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 2.7 / 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.fill,
            errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
          ),
        ));
  }
}
