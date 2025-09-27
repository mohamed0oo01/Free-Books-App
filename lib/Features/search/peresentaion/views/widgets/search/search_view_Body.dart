import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/Home/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:movie_app/Features/search/peresentaion/views/widgets/search/coustom_search_text_feald.dart';
import 'package:movie_app/Features/search/peresentaion/views/widgets/search/searchResult.dart';

class SearshViewBody extends StatelessWidget {
  const SearshViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controler = TextEditingController();

    return Column(
      children: [
        CoustomSearchTextField(
          controller: controler,

          onChange: (value) {
            if (value.isNotEmpty) {
              context.read<SearchBooksCubit>().feachSearchBooks(Query: value);
            }
          },
        ),
        const SizedBox(height: 20),
        Expanded(child: searchResult()),
      ],
    );
  }
}

