import 'dart:developer';

import 'package:bookly_app/core/errors/fauilers.dart';
import 'package:bookly_app/core/utils/api_serves.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiServes apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Fauilers, List<BookModel>>> fetchSearchBooks(
      {required String query}) async {
    try {
      var data = await apiService.get(
        endPoint: 'volumes?q=$query',
      );
      List<BookModel> searchResultbooks = [];
      for (var item in data['items']) {
        searchResultbooks.add(BookModel.fromJson(item));
      }
      return right(searchResultbooks);
    } catch (e) {
      log('${e}error from here');
      if (e is DioException) {
        return left(
          ServerFauiler.fromDioException(e),
        );
      }
      return left(
        ServerFauiler('$e'),
      );
    }
  }
}
