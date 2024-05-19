import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_appBar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomBookDetailsAppBar(),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.48,
          height: MediaQuery.of(context).size.height * 0.24,
          child: const CustomBookImage(),
        ),
        const SizedBox(
          height: 25,
        ),
        const Text(
          'The Jungle Book',
          style: Styles.textStyle30,
        ),
        Text(
          'Rudyard Kipling',
          style: Styles.textStyle18.copyWith(
              color: Colors.white.withOpacity(0.5),
              fontStyle: FontStyle.italic),
        ),
        const SizedBox(
          height: 20,
        ),
        const BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 20,
        ),
        const CustomButton(),
      ],
    );
  }
}
