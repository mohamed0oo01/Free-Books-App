import 'package:flutter/material.dart';
import 'package:movie_app/Features/Home/data/models/books_models/books_models.dart';
import 'package:movie_app/Features/Home/presentation/views/widgets/CoustomListView.dart';
import 'package:movie_app/Features/Home/presentation/views/widgets/Rate_Widget.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book,});
  final BooksModels book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: width * .2, left: width * .2),
          child:  CoustomListViewItem(imageUrl:book.volumeInfo.imageLinks?.thumbnail??''),
        ),
        const SizedBox(height: 43),
        Text(book.volumeInfo.title!, textAlign: TextAlign.center,style: TextStyle(fontSize: 30)),
        const SizedBox(height: 6),
        Opacity(
          opacity: 0.7,
          child: Text(
            book.volumeInfo.authors?[0]??'' ,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        const SizedBox(height: 16),
        RateWidget(
          coustommainAxisAlignment: MainAxisAlignment.center,
          count: book.volumeInfo.ratingsCount??0,
          rating: book.volumeInfo.averageRating??0,
        ),
        const SizedBox(height: 39),
      ],
    );
  }
}
