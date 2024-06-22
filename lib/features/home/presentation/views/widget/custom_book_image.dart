import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: Colors.red,
            image: const DecorationImage(
                image: AssetImage(
                  "assets/images/test_image.png",
                ),
                fit: BoxFit.fill)),
      ),
    );
  }
}
