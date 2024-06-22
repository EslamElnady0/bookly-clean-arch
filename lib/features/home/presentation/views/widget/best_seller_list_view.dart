import 'package:bookly/features/home/presentation/views/widget/best_seller_listview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: const BestSellerListViewItem(),
          ),
        );
      },
    );
  }
}
