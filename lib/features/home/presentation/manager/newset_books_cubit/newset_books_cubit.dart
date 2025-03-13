import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newset_books_state.dart';

class NewsedBooksCubit extends Cubit<NewsetBooksState> {
  NewsedBooksCubit(this.homeRepo) : super(NewsetBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetchNewsetBooks() async {
    emit(NewsetBooksLoading());
    var result = await homeRepo.fetchBestSellerBooks();
    result.fold(
      (failure) => emit(NewsetBooksFailure(failure.toString())),
      (books) => emit(NewsetBooksSuccess(books)),
    );
  }
}
