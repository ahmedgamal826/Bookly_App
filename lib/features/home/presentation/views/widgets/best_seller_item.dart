import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Text(
            'Harry Potter and the Goblet of Fire ',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Styles.textStyle20.copyWith(fontFamily: kGtSectraFine),
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        const Text(
          'J.K. Rowling',
          style: Styles.textStyle14,
        ),
        const SizedBox(
          height: 11,
        ),
        Row(
          children: [
            Text(
              '19.99 €',
              style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 37,
            ),
            BookRating(),
          ],
        )
      ],
    );
  }
}
