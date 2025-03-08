import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.257),
          child: FeaturedListViewItem(),
        ),
        const SizedBox(height: 20),
        Text('The Jungle Book',
            style: Styles.textStyle20.copyWith(fontSize: 25)),
        const SizedBox(height: 6),
        Opacity(
          opacity: 0.7,
          child: Text('Rudyard Kipling',
              style: Styles.textStyle16.copyWith(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              )),
        ),
        const SizedBox(height: 5),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(height: 5),
        BooksAction(),
      ],
    );
  }
}
