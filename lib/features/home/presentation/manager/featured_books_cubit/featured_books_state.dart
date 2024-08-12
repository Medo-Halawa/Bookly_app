part of 'featured_books_cubit.dart';

abstract class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}

final class FeaturedBooksLoaded extends FeaturedBooksState {
  final List<BookModel> books;

  const FeaturedBooksLoaded(this.books);

  @override
  List<Object> get props => [books];
}

final class FeaturedBooksError extends FeaturedBooksState {
  final String message;

  const FeaturedBooksError(this.message);

  @override
  List<Object> get props => [message];
}
