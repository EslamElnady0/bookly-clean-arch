import 'package:bookly/core/util/styles.dart';
import 'package:bookly/features/home/presentation/views/widget/best_seller_list_view.dart';
import 'package:bookly/features/home/presentation/views/widget/cutom_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widget/featured_books_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(),
              const FeaturedBooksListView(),
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Text(
                  "Best Seller",
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: BestSellerListView(),
        )
      ],
    );
  }
}
