// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:dartz/dartz.dart';

import 'package:bookly_app/core/errors/fauilers.dart';
import 'package:bookly_app/core/utils/api_serves.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServes apiServes;
  HomeRepoImpl({
    required this.apiServes,
  });
  @override
  Future<Either<Fauilers, List<BookModel>>> fetchBestSellerBooks() async {
    try {
      var data = await apiServes.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=subject:computer science');

      List<BookModel> books = [];
      for (var item in data['items']) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          log(e.toString());
        }
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFauiler.fromDioException(e));
      }
      return Left(ServerFauiler(e.toString()));
    }
  }

  @override
  Future<Either<Fauilers, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiServes.get(
          endPoint:
              'volumes?Filtering=free-ebooks&sorting=newest&q=subject:programming');

      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFauiler.fromDioException(e));
      }
      return Left(ServerFauiler(e.toString()));
    }
  }
}
