import 'package:bookly/features/home/presentation/manager/featured%20box%20cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widget/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entities/book_entity.dart';

class FeaturedBooksListView extends StatefulWidget {
  final List<BookEntity> books;
  const FeaturedBooksListView({super.key, required this.books});

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  var nextPage = 1;
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    var currentPosition = _scrollController.position.pixels;
    var maxScrollExtent = _scrollController.position.maxScrollExtent;
    if (currentPosition >= maxScrollExtent * 0.7) {
      context
          .read<FeaturedBooksCubit>()
          .fetchFeaturedBooks(pageNumber: nextPage++);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: SizedBox(
        height: 250.h,
        child: ListView.builder(
            controller: _scrollController,
            itemCount: widget.books.length,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: SizedBox(
                    height: 250.h,
                    child: CustomBookImage(
                      imageUrl: widget.books[index].image!,
                    )),
              );
            }),
      ),
    );
  }
}
