import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/Home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:movie_app/Features/Home/presentation/views/widgets/CoustomListView.dart';
import 'package:movie_app/core/utils/app_router.dart';
import 'package:movie_app/core/widgets/coustom_error_widget.dart';
import 'package:movie_app/core/widgets/coustom_loading_indector.dart';

class Similarcoustomlistviewitem extends StatelessWidget {
  const Similarcoustomlistviewitem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),

                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).replace(
                      AppRouter.KbookDetailsView,
                      extra: state.books[index],
                    );
                  },
                  child: CoustomListViewItem(
                    imageUrl:
                        state.books[index].volumeInfo.imageLinks?.thumbnail ??
                        '',
                  ),
                ),
              );
            },
          );
        } else if (state is SimilarBooksFailure) {
          return coustomErrorMasseg(Error: state.errorMasseg);
        } else {
          return const CoustomLoadingIndector();
        }
      },
    );
  }
}
