import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturedBooksListViewItemLoadingIndicator extends StatelessWidget {
  const FeaturedBooksListViewItemLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 2.7 / 4,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Container(
              color: Colors.grey,
            )));
  }
}
