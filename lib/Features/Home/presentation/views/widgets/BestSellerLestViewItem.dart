import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/Home/data/models/books_models/books_models.dart';
import 'package:movie_app/Features/Home/presentation/views/widgets/CoustomListView.dart';
import 'package:movie_app/Features/Home/presentation/views/widgets/Rate_Widget.dart';
import 'package:movie_app/core/utils/Style.dart';
import 'package:movie_app/core/utils/app_router.dart';

class BestSallerListViewItem extends StatelessWidget {
  const BestSallerListViewItem({super.key, required this.bookModel});

  final BooksModels bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.KbookDetailsView, extra: bookModel);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CoustomListViewItem(
              imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
            ),
            // AspectRatio(
            //   aspectRatio: 2.5 / 4,
            //   child: Container(
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(8),
            //       // color: (Colors.red),
            //       image: DecorationImage(
            //         fit: BoxFit.fill,
            //         image: AssetImage(assetsData.test2),
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(width: 30),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      (bookModel.volumeInfo.title != null &&
                              bookModel.volumeInfo.title!.isNotEmpty)
                          ? bookModel.volumeInfo.title!
                          : 'No Title',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    (bookModel.volumeInfo.authors != null &&
                            bookModel.volumeInfo.authors!.isNotEmpty)
                        ? bookModel.volumeInfo.authors!.first
                        : 'Unknown Author',
                    maxLines: 1,
                    style: Styles.textStyle16,
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      RateWidget(
                        rating:
                            bookModel.volumeInfo.averageRating?.round() ?? 0,
                        count: bookModel.volumeInfo.ratingsCount ?? 0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
