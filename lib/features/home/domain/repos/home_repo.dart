import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNumber = 0});
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks();
}
