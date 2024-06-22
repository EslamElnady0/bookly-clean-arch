import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../home/presentation/views/widget/best_seller_listview_item.dart';

class SearchResultsListView extends StatelessWidget {
  const SearchResultsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: const BestSellerListViewItem(),
        );
      },
    );
  }
}
