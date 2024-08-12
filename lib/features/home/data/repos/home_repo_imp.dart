import 'dart:developer';
import 'package:bookly/core/utils/api.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'home_repo.dart';

class HomeRepoImp implements HomeRepo {
  final ApiService apiService;

  HomeRepoImp({required this.apiService});
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      log("hello");
      var data = await apiService.get(
          'volumes?Filtering=free-ebooks&q=subject:programming&Sorting=newest');
      log("hello2");
      List<BookModel> books = [];
      for (var item in data['items']) {
        log("this the first iteration");
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

  @override
  Future<Either<Failure, List<BookModel>>> fetchFearuredBooks() async {
    try {
      var data = await apiService
          .get('volumes?Filtering=free-ebooks&q=subject:programming');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      log("hello");
      var data = await apiService.get(
          'volumes?Filtering=free-ebooks&q=subject:$category&Sorting=relevance');
      log("hello2");
      List<BookModel> books = [];
      for (var item in data['items']) {
        log("this the first iteration");
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
