import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/Home/presentation/manager/Newest_books_Cubit/newest_books_cubit.dart';
import 'package:movie_app/Features/Home/presentation/views/widgets/BestSellerLestViewItem.dart';
import 'package:movie_app/core/widgets/coustom_error_widget.dart';
import 'package:movie_app/core/widgets/coustom_loading_indector.dart';

class BestSallerListView extends StatelessWidget {
  const BestSallerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.books.length,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BestSallerListViewItem(bookModel: state.books[index],),
              );
            },
          );
        } else if (state is NewestBooksFailuer) {
          return coustomErrorMasseg(Error: state.errMasseg);
        } else {
          return const CoustomLoadingIndector();
        }
      },
    );
  }
}
