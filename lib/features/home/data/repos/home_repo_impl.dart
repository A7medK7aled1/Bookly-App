import 'package:bookly_app/core/errors/fauilers.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Fauilers, List<BookModel>>> fetchBestSellerBooks() {
    throw UnimplementedError();
  }

  @override
  Future<List<BookModel>> fetchFeaturedBooks() {
    throw UnimplementedError();
  }
}
