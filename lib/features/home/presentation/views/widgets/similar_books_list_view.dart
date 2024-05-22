import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.17,
      width: MediaQuery.of(context).size.width * 1.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return CustomBookImage(
              imageUrl:
                  'https://t3.ftcdn.net/jpg/03/83/46/48/360_F_383464809_VAyaM0bON9NZT1UCPXghp8GhHx56QKqm.jpg',
              width: MediaQuery.of(context).size.width * 0.29,
            );
          },
        ),
      ),
    );
  }
}
