import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_search_textfield.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: CustomSearchTextField(
            onChanged: (String ds) {
              context.read<SearchCubit>().searchBooks(query: ds);
            },
          ),
        ),
        const SizedBox(height: 30),
        const Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text(
            'Search resuts',
            style: Styles.textStyle18,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 30),
        const Expanded(
          child: SearchResultListView(),
        ),
      ],
    );
  }
}
