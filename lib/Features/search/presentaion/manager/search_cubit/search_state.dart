part of 'search_cubit.dart';

sealed class SearchBookState extends Equatable {
  const SearchBookState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchBookState {}

final class SearchbookLoading extends SearchBookState {}

final class SearchbookSuccess extends SearchBookState {
  final List<BookModel> books;

  const SearchbookSuccess(this.books);
}

final class SearchbookFailure extends SearchBookState {
  final String errormessage;

  const SearchbookFailure(this.errormessage);
}
