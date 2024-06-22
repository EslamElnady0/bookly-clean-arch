import 'package:bookly/features/home/presentation/views/widget/similar_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/util/styles.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("You may also like",
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold)),
        SizedBox(
          height: 15.h,
        ),
        const SimilarBooksListView(),
        SizedBox(
          height: 40.h,
        )
      ],
    );
  }
}
