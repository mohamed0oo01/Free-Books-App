import 'package:flutter/material.dart';
import 'package:movie_app/Features/Home/presentation/views/widgets/similarCoustomListViewItem.dart';

class similarBooksLIstView extends StatelessWidget {
  const similarBooksLIstView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: Similarcoustomlistviewitem(),
    );
  }
}
