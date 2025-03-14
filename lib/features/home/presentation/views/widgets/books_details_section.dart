import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.257),
          child: FeaturedListViewItem(
            imageURL: bookModel.volumeInfo.imageLinks.thumbnail ?? '',
          ),
        ),
        const SizedBox(height: 20),
        Text(bookModel.volumeInfo.title!,
            overflow: TextOverflow.ellipsis,
            style: Styles.textStyle20.copyWith(fontSize: 25)),
        const SizedBox(height: 6),
        Opacity(
          opacity: 0.7,
          child: Text(bookModel.volumeInfo.authors![0],
              style: Styles.textStyle16.copyWith(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              )),
        ),
        const SizedBox(height: 5),
        BookRating(
          rating: bookModel.volumeInfo.averageRating ?? 0,
          count: bookModel.volumeInfo.ratingsCount ?? 0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(height: 5),
        BooksAction(
          bookModel: bookModel,
        ),
      ],
    );
  }
}
