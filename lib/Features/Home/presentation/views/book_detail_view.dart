import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Features/Home/data/models/books_models/books_models.dart';
import 'package:movie_app/Features/Home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:movie_app/Features/Home/presentation/views/widgets/BookDetailsViewBody.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookModel});
  final BooksModels bookModel;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context).feachSimilarBooks(Category: widget.bookModel.volumeInfo.categories![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: SafeArea(child: BookdetailsViewBody(  bookModel: widget.bookModel,)));
  }
}
