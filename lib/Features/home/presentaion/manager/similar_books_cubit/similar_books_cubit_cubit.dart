import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/book_model/book_model.dart';

part 'similar_books_cubit_state.dart';

class SimilarBooksCubitCubit extends Cubit<SimilarBooksCubitState> {
  SimilarBooksCubitCubit(this.homerepo) : super(SimilarBooksCubitInitial());

  final HomeRepo homerepo;
  Future<void> fetchSimilarBooks({
    required String category,
  }) async {
    emit(SimilarBooksCubitLoading());
    var result = await homerepo.fetchSimilarBooks(category: category);
    result.fold((failer) {
      emit(SimilarBooksCubitFailure(failer.message));
    }, (books) {
      emit(SimilarBooksCubitSuccess(books));
    });
  }
}
