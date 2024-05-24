import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key, this.mainAxisAlignment = MainAxisAlignment.start});

  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const SizedBox(
          width: 15,
        ),
        Text(
          'page',
          style: Styles.textStyle14.copyWith(
            color: Colors.white.withOpacity(0.5),
          ),
        )
      ],
    );
  }
}
