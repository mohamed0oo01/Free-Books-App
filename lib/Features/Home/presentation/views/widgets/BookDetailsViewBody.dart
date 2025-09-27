import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/Features/Home/data/models/books_models/books_models.dart';
import 'package:movie_app/Features/Home/presentation/views/widgets/AlsoLikeBookdSection.dart';
import 'package:movie_app/Features/Home/presentation/views/widgets/BookDetailsSection.dart';
import 'package:movie_app/Features/Home/presentation/views/widgets/Books_Actions.dart';
import 'package:movie_app/Features/Home/presentation/views/widgets/Coustom_Book_Details_AppBar.dart';

class BookdetailsViewBody extends StatelessWidget {
  const BookdetailsViewBody({super.key, required this.bookModel});
  final BooksModels bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const CoustomBookDetailsAppbar(),
          BookDetailsSection(book: bookModel),

           BooksAcions(bookModel: bookModel,),
          const Expanded(child: const SizedBox(height: 50)),
          const AlsoLikeBookdSection(),
        ],
      ),
    );
  }
}
