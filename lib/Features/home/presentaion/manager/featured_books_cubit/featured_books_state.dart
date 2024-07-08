part of 'featured_books_cubit.dart';

sealed class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksloading extends FeaturedBooksState {}

final class FeaturedBooksFauiler extends FeaturedBooksState {
  final String errmessage;

  const FeaturedBooksFauiler(this.errmessage);
}

// ignore: must_be_immutable
final class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookModel> books;

  const FeaturedBooksSuccess(this.books);
}
