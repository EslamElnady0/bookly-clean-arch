import 'package:hive_flutter/hive_flutter.dart';

import '../../../features/home/domain/entities/book_entity.dart';

saveBooksData({required List<BookEntity> books, required String boxName}) {
  var box = Hive.box(boxName);
  box.addAll(books);
}
