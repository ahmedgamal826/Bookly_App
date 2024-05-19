import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_appBar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomBookDetailsAppBar(),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.48,
          height: MediaQuery.of(context).size.height * 0.33,
          child: CustomBookImage(),
        ),
      ],
    );
  }
}
