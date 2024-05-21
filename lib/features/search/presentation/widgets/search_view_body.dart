import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/search/presentation/widgets/custom_search_text_field.dart';
import 'package:bookly_app/features/search/presentation/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        const CustomSearchListView(),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Search Result',
            style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const SearchResultListView(),
      ],
    );
  }
}
