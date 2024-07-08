import 'package:bookly_app/Features/home/presentaion/manager/newset_books_cubit/newset_books_cubit.dart';
import 'package:bookly_app/Features/home/presentaion/views/widgets/best_seller_listview_item.dart';
import 'package:bookly_app/core/widgets/custom_error.dart';
import 'package:bookly_app/core/widgets/custom_loadingindicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
      builder: (context, state) {
        if (state is NewsetBooksSuccess) {
          return ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BookListViewItem(
                    bookmodel: state.books[index],
                  ),
                );
              },
              itemCount: state.books.length);
        } else if (state is NewsetBooksFaiuler) {
          return CustomErrorWidget(errorMessage: state.errmessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
