import 'package:flutter/material.dart';
import 'package:movie_app/Features/Home/presentation/views/widgets/similarBooksLIstView.dart';

class AlsoLikeBookdSection extends StatelessWidget {
  const AlsoLikeBookdSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You Can Also Like',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),

        const SizedBox(height: 16),
        similarBooksLIstView(),
        const SizedBox(height: 20),
      ],
    );
  }
}
