import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key,
      required this.mainAxisAlignment,
      required this.rating,
      required this.count});
  final MainAxisAlignment mainAxisAlignment;

  final int rating;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.yellow,
          size: 16,
        ),
        SizedBox(width: 6.3),
        Text('$rating', style: Styles.textStyle16),
        SizedBox(width: 5),
        Text(
          '($count)',
          style: Styles.textStyle14.copyWith(color: Colors.grey),
        )
      ],
    );
  }
}
