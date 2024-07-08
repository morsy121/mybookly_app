import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repo/home_repo.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.homerepo) : super(NewsetBooksInitial());

  final HomeRepo homerepo;
  Future<void> fetchNewsetBooks() async {
    emit(NewsetBooksLoaading());
    var result = await homerepo.fetchNewsetBooks();
    result.fold((failer) {
      emit(NewsetBooksFaiuler(failer.message));
    }, (books) {
      emit(NewsetBooksSuccess(books));
    });
  }
}
