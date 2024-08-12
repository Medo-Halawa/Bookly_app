import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';
import 'books_action.dart';
import 'custom_book_card.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: CustomBookImage(
            imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
          ),
        ),
        const SizedBox(height: 43),
        Text(
          bookModel.volumeInfo.title!,
          style: Styles.textStyle30,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Text(
          bookModel.volumeInfo.authors![0],
          style:
              Styles.textStyle18.copyWith(color: Colors.white.withOpacity(.7)),
        ),
        const SizedBox(height: 18),
        BookRating(
            rating: bookModel.volumeInfo.averageRating ?? 0,
            totalRating: bookModel.volumeInfo.ratingsCount ?? 0),
        const SizedBox(height: 37),
        BooksActions(bookModel: bookModel),
      ],
    );
  }
}
