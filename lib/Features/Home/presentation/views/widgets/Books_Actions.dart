import 'package:flutter/material.dart';
import 'package:movie_app/Features/Home/data/models/books_models/books_models.dart';
import 'package:movie_app/core/widgets/coustom_button.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAcions extends StatelessWidget {
  const BooksAcions({super.key, required this.bookModel});

  final BooksModels bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: CoustomButton(
              FontSize: 18,
              text: 'Free',
              BackgroundColor: Colors.white,
              TextColor: Colors.black,
              Border_Radius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: CoustomButton(
              onPressed: () async {
                Uri uri = Uri.parse(bookModel.volumeInfo.previewLink!);
                if (!await launchUrl(uri)) {
                  throw Exception('Could not launch $uri');
                }
              },
              FontSize: 15,
              text: 'Free Preview',
              BackgroundColor: Colors.deepOrangeAccent,
              TextColor: Colors.white,
              Border_Radius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
