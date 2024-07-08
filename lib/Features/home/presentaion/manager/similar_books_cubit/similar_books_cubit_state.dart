part of 'similar_books_cubit_cubit.dart';

sealed class SimilarBooksCubitState extends Equatable {
  const SimilarBooksCubitState();

  @override
  List<Object> get props => [];
}

class SimilarBooksCubitInitial extends SimilarBooksCubitState {}

class SimilarBooksCubitLoading extends SimilarBooksCubitState {}

class SimilarBooksCubitSuccess extends SimilarBooksCubitState {
  final List<BookModel> books;

  const SimilarBooksCubitSuccess(this.books);
}

class SimilarBooksCubitFailure extends SimilarBooksCubitState {
  final String errMessage;
  const SimilarBooksCubitFailure(this.errMessage);
}
