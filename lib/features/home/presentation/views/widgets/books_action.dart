import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: CustomButton(
          text: r'19.99 $',
          backgroundColor: Colors.white,
          textColor: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
        )),
        Expanded(
            child: CustomButton(
          text: 'Free Preview',
          backgroundColor: Color(0xfff08364),
          textColor: Colors.black,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        )),
      ],
    );
  }
}
