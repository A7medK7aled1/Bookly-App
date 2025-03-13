import 'package:bookly_app/core/errors/fauilers.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Fauilers, List<BookModel>>> fetchBestSellerBooks();
  Future<Either<Fauilers, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Fauilers, List<BookModel>>> fetchSimilarBooks(
      {required String category});
}
