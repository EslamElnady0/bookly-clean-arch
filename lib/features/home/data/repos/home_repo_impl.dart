import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/home/data/data%20sources/home_remote_data_source.dart';

import 'package:bookly/features/home/domain/entities/book_entity.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../domain/repos/home_repo.dart';
import '../data sources/home_local_data_source.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;
  HomeRepoImpl(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      var cachedBooks = homeLocalDataSource.fetchFeaturedBooks();
      if (cachedBooks.isNotEmpty) {
        return right(cachedBooks);
      }
      var books = await homeRemoteDataSource.fetchFeaturedBooks();
      return right(books);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      var cachedBooks = homeLocalDataSource.fetchNewestBooks();
      if (cachedBooks.isNotEmpty) {
        return right(cachedBooks);
      }
      var books = await homeRemoteDataSource.fetchNewestBooks();
      return right(books);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
