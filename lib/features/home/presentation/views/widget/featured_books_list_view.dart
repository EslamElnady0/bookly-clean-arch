import 'package:bookly/features/home/presentation/views/widget/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entities/book_entity.dart';

class FeaturedBooksListView extends StatelessWidget {
  final List<BookEntity> books;
  const FeaturedBooksListView({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: SizedBox(
        height: 250.h,
        child: ListView.builder(
            itemCount: books.length,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: SizedBox(
                    height: 250.h,
                    child: CustomBookImage(
                      imageUrl: books[index].image!,
                    )),
              );
            }),
      ),
    );
  }
}
