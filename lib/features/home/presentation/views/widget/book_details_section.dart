import 'package:bookly/features/home/presentation/views/widget/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widget/books_actions.dart';
import 'package:bookly/features/home/presentation/views/widget/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/util/styles.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 80.w),
          child: const CustomBookImage(),
        ),
        SizedBox(
          height: 40.h,
        ),
        Text(
          "The Jungle Book",
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          "Rudyard Kipling",
          style: Styles.textStyle18
              .copyWith(color: Colors.grey, fontStyle: FontStyle.italic),
        ),
        SizedBox(
          height: 18.h,
        ),
        const BookRating(),
        SizedBox(
          height: 25.h,
        ),
        const BookActions(),
      ],
    );
  }
}
