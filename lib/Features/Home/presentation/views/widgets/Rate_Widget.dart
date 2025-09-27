import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/Style.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({
    super.key,
    this.coustommainAxisAlignment = MainAxisAlignment.start, required this.count, required this.rating,
  });

  final MainAxisAlignment coustommainAxisAlignment;
  final int count;
  final num rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: coustommainAxisAlignment,
      children: [
        Icon(Icons.star, color: Colors.amber, size: 18),
        const SizedBox(width: 6.3),
        Text(
          rating.toString(),
          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 5),
        Opacity(
          opacity: 0.5,
          child: Text('{$count}', style: Styles.textStyle16),
        ),
      ],
    );
  }
}
