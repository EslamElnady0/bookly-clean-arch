import 'package:bookly/features/search/presentation/views/widgets/custom_search_textfield.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_results_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/util/styles.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomSearchTextField(),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Search Results",
            style: Styles.textStyle18,
          ),
          SizedBox(
            height: 20.h,
          ),
          const Expanded(child: SearchResultsListView())
        ],
      ),
    );
  }
}
