import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/search/presentation/manager/cubit/search_books_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        CustomTextfield(
            onChanged: (value) {
              setState(() {
                BlocProvider.of<SearchBooksCubit>(context)
                    .searchBooks(search: value);
              });
            },
            suffixIcon: Icons.search,
            hintText: 'Search'),
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
