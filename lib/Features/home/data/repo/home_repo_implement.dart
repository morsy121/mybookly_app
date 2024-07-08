import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repo/home_repo.dart';
import 'package:bookly_app/core/errors/errors.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplemet implements HomeRepo {
  final ApiService apiService;

  HomeRepoImplemet(this.apiService);
  @override
  Future<Either<Fauiler, List<BookModel>>> fetchNewsetBooks() async {
    try {
      var data = await apiService.get(
          endpoint:
              "volumes?Filtering=free-ebooks&sorting =newest&q=computer science");
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFauiler.fromDioError(e),
        );
      }
      return left(ServerFauiler(
        e.toString(),
      ));
    }
  }

  @override
  Future<Either<Fauiler, List<BookModel>>> fetchFeatureBooks() async {
    try {
      var data = await apiService.get(
          endpoint: "volumes?Filtering=free-ebooks&q=subject:programming ");
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFauiler.fromDioError(e),
        );
      }
      return left(ServerFauiler(
        e.toString(),
      ));
    }
  }

  @override
  Future<Either<Fauiler, List<BookModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      var data = await apiService.get(
          endpoint:
              "volumes?Filtering=free-ebooks&sorting=relevance&q=subject:programming ");
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFauiler.fromDioError(e),
        );
      }
      return left(ServerFauiler(
        e.toString(),
      ));
    }
  }
}
