import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/book_model/book_model.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homerepo) : super(FeaturedBooksInitial());
  final HomeRepo homerepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksloading());
    var result = await homerepo.fetchFeatureBooks();
    result.fold((failer) {
      emit(FeaturedBooksFauiler(failer.message));
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}
