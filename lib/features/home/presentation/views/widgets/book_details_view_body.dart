import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
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
                const SizedBox(height: 0),
                BookRating(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                const SizedBox(height: 8),
                BooksAction(),
                Expanded(child: const SizedBox(height: 20)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('You can also like',
                      style: Styles.textStyle14
                          .copyWith(fontWeight: FontWeight.w600)),
                ),
                const SizedBox(height: 20),
                SimilarBookListView(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        )
      ],
    );
  }
}
