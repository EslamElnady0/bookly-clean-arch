import 'package:bookly/constants.dart';
import 'package:bookly/core/models/book/book_model.dart';
import 'package:bookly/core/util/api_service.dart';
import 'package:bookly/core/util/functions/save_books_data.dart';

import '../../domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint:
            "volumes?q=subject:programming&Filtering=free-ebooks&startIndex=${pageNumber * 10}");
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books: books, boxName: kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(
        endPoint:
            "volumes?q=computer science&Filtering=free-ebooks&Sorting=newest");
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books: books, boxName: kNewestBox);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var book in data["items"]) {
      books.add(BookModel.fromJson(book));
    }
    return books;
  }
}
