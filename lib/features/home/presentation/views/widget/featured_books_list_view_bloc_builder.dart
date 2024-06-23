import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';
import '../../manager/featured box cubit/featured_books_cubit.dart';
import 'featured_books_list_view.dart';

class FeaturedBooksListViewBlocConsumer extends StatefulWidget {
  const FeaturedBooksListViewBlocConsumer({super.key});

  @override
  State<FeaturedBooksListViewBlocConsumer> createState() =>
      _FeaturedBooksListViewBlocConsumerState();
}

class _FeaturedBooksListViewBlocConsumerState
    extends State<FeaturedBooksListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
        listener: (context, state) {
      if (state is FeaturedBooksSuccess) {
        books.addAll(state.books);
      }
      if (state is FeaturedBooksPagenationFailure) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(state.errMessage),
        ));
      }
    }, builder: (context, state) {
      if (state is FeaturedBooksSuccess ||
          state is FeaturedBooksPagenationLoading ||
          state is FeaturedBooksPagenationFailure) {
        return FeaturedBooksListView(
          books: books,
        );
      } else if (state is FeaturedBooksFailure) {
        return Text(state.errMessage);
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
