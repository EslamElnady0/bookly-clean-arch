import 'package:bookly/core/util/app_router.dart';
import 'package:bookly/core/util/extentions.dart';
import 'package:bookly/features/home/presentation/views/widget/book_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/util/styles.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.goTo(AppRouter.bookDetails);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120.h,
            child: AspectRatio(
              aspectRatio: 3.2 / 5,
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
            ),
          ),
          SizedBox(
            width: 30.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200.w,
                  child: Text(
                    "Harry Potter and the Goblet of Fire",
                    style: Styles.textStyle20
                        .copyWith(fontFamily: "GT Sectra Fine"),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 3.5.h,
                ),
                Text(
                  "J. K. Rowling",
                  style: Styles.textStyle14.copyWith(color: Colors.grey),
                ),
                SizedBox(height: 3.5.h),
                Row(
                  children: [
                    Text(r"19.99$",
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.bold)),
                    const Spacer(),
                    const BookRating(),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
