part of 'featured_books_cubit.dart';

sealed class FeaturedBooksState {}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}

final class FeaturedBooksPagenationLoading extends FeaturedBooksState {}

final class FeaturedBooksPagenationFailure extends FeaturedBooksState {
  final String errMessage;
  FeaturedBooksPagenationFailure(this.errMessage);
}

final class FeaturedBooksSuccess extends FeaturedBooksState {
  List<BookEntity> books;
  FeaturedBooksSuccess(this.books);
}

final class FeaturedBooksFailure extends FeaturedBooksState {
  final String errMessage;

  FeaturedBooksFailure(this.errMessage);
}
