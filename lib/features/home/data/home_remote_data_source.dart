import 'package:bookly/core/models/book/book_model.dart';
import 'package:bookly/core/util/api_service.dart';

import '../domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(
        endPoint: "volumes?q=subject:programming&Filtering=free-ebooks");
    List<BookEntity> books = getBooksList(data);

    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var book in data["items"]) {
      books.add(BookModel.fromJson(book));
    }
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }
}
