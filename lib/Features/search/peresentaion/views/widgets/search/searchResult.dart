import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/Home/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:movie_app/Features/Home/presentation/views/widgets/BestSellerLestViewItem.dart';
import 'package:movie_app/core/widgets/coustom_error_widget.dart';
import 'package:movie_app/core/widgets/coustom_loading_indector.dart';

class searchResult extends StatelessWidget {
  const searchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return ListView.builder(
            physics: const   BouncingScrollPhysics(),
            itemCount: state.books.length,
            padding: EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BestSallerListViewItem(bookModel: state.books[index]),
              );
            },
          );
        } else if (state is SearchBooksFailuer) {
          return coustomErrorMasseg(Error: state.errmasseg);
        } else if (state is SearchBooksLoading) {
          return Center(child: const CoustomLoadingIndector());
        } else {
          return Center(child: Text('enter book name'));
        }
      },
    );
  }
}
