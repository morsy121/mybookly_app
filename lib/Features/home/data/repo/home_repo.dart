import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/core/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Fauiler, List<BookModel>>> fetchNewsetBooks();
  Future<Either<Fauiler, List<BookModel>>> fetchFeatureBooks();
  Future<Either<Fauiler, List<BookModel>>> fetchSimilarBooks(
      {required String category});
}
