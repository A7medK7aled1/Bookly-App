import 'package:bookly_app/core/errors/fauilers.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Fauilers, List<BookModel>>> fetchSearchBooks(
      {required String query});
}
