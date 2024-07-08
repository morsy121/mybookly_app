import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/core/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Fauiler, List<BookModel>>> fetchSearchBooks(
      String bookName);
}
