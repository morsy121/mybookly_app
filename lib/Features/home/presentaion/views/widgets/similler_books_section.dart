import 'package:bookly_app/Features/home/presentaion/views/widgets/similler_books_list_view.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SimiilerBookSection extends StatelessWidget {
  const SimiilerBookSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("You can also like",
            style: Styles.textstyle14.copyWith(fontWeight: FontWeight.w700)),
        const SizedBox(
          height: 16,
        ),
        const SimillerBooksListView(),
      ],
    );
  }
}
