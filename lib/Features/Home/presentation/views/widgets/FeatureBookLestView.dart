import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/Home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:movie_app/Features/Home/presentation/views/widgets/CoustomListView.dart';
import 'package:movie_app/core/utils/app_router.dart';
import 'package:movie_app/core/widgets/coustom_error_widget.dart';
import 'package:movie_app/core/widgets/coustom_loading_indector.dart';

class FeatureBookLestView extends StatelessWidget {
  const FeatureBookLestView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(
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
            ),
          );
        } else if (state is FeaturedBooksFailuer) {
          return coustomErrorMasseg(Error: state.errmasseg);
        } else {
          return const CoustomLoadingIndector();
        }
      },
    );
  }
}
