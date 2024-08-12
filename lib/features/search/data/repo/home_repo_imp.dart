import 'dart:developer';

import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/core/utils/api.dart';
import 'package:bookly/features/search/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImp implements SearchRepo {
  final ApiService apiService;

  SearchRepoImp({required this.apiService});

  @override
  Future<Either<Failure, List<BookModel>>> searchBooks(
      {required String query}) async {
    try {
      var data = await apiService.get(
          'volumes?Filtering=free-ebooks&q=subject:$query&Sorting=relevance');

      List<BookModel> books = [];
      if (data['items'] == null) {
        return Right(books);
      }
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      log(books[0].volumeInfo.imageLinks?.thumbnail ?? '');
      return Right(books);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('error: $e');
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
