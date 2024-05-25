import 'package:bookly_app/core/functions/launch_custom_url.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_appBar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomBookDetailsAppBar(),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.55,
          height: MediaQuery.of(context).size.height * 0.27,
          child: CustomBookImage(
              width: MediaQuery.of(context).size.width * 0.2,
              imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? ''),
        ),
        const SizedBox(
          height: 25,
        ),
        Text(bookModel.volumeInfo.title!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Styles.textStyle30
                .copyWith(fontWeight: FontWeight.bold, fontSize: 25)),
        Text(
          bookModel.volumeInfo.authors?[0] ?? '',
          style: Styles.textStyle18.copyWith(
              color: Colors.white.withOpacity(0.5),
              fontStyle: FontStyle.italic),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BookRating(
              rating: bookModel.volumeInfo.averageRating ?? 0.0,
              count: bookModel.volumeInfo.ratingsCount ?? 0,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        CustomButton(
          bookModel: bookModel,
          onPressed: () async {
            await launchCustomUrl(context, bookModel.volumeInfo.previewLink!);
          },
        ),
      ],
    );
  }
}
