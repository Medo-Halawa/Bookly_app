import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key, required this.rating, required this.totalRating});
  final num rating;
  final int totalRating;
  @override
  Widget build(BuildContext context) {
    
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Icon(FontAwesomeIcons.solidStar, color: Colors.yellow),
      const SizedBox(width: 6.3),
      Text(
        rating.toString(),
        style: Styles.textStyle16,
      ),
      const SizedBox(width: 5),
      Text(' ($totalRating)',
          style: Styles.textStyle14.copyWith(color: Colors.grey))
    ]);
  }
}
