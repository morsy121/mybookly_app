import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/search/data/repo/search_repo.dart';
import 'package:bookly_app/core/errors/errors.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImple implements SearchRepo {
  final ApiService apiService;

  SearchRepoImple(this.apiService);
  @override
  Future<Either<Fauiler, List<BookModel>>> fetchSearchBooks(
      String bookName) async {
    try {
      var data = await apiService.get(
        endpoint: "volumes?Filtering=free-ebooks&q=$bookName",
      );
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
