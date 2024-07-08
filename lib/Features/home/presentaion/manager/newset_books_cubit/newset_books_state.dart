part of 'newset_books_cubit.dart';

sealed class NewsetBooksState extends Equatable {
  const NewsetBooksState();

  @override
  List<Object> get props => [];
}

final class NewsetBooksInitial extends NewsetBooksState {}

final class NewsetBooksLoaading extends NewsetBooksState {}

final class NewsetBooksFaiuler extends NewsetBooksState {
  final String errmessage;

  const NewsetBooksFaiuler(this.errmessage);
}

final class NewsetBooksSuccess extends NewsetBooksState {
  final List<BookModel> books;

  const NewsetBooksSuccess(this.books);
}
