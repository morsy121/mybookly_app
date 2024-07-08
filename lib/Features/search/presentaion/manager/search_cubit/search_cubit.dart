import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/search/data/repo/search_repo.dart';

import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchbookCubit extends Cubit<SearchBookState> {
  SearchbookCubit(
    this.searchrepo,
  ) : super(SearchInitial());
  final SearchRepo searchrepo;
  Future<void> fetchSearchBooks({
    required String bookName,
  }) async {
    emit(SearchbookLoading());
    var result = await searchrepo.fetchSearchBooks(
     bookName,
    );
    result.fold((failer) {
      emit(SearchbookFailure(failer.message));
    }, (books) {
      emit(SearchbookSuccess(books));
    });
  }
}
