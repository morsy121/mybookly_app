import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentaion/views/widgets/best_seller_listview_item.dart';
import 'package:bookly_app/Features/search/presentaion/manager/search_cubit/search_cubit.dart';
import 'package:bookly_app/Features/search/presentaion/views/widgets/custom_search_text_field.dart';
import 'package:bookly_app/core/utils/styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  var textController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchbookCubit, SearchBookState>(
      builder: (context, state) {
        return Form(
          autovalidateMode: autoValidateMode,
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 30, right: 20),
                child: CustomSearchTextField(
                  controller: textController,
                  hintText: "Serch Books",
                  onFieldSubmitted: (data) {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<SearchbookCubit>(context)
                          .fetchSearchBooks(
                        categoryName: data,
                      );
                    } else {
                      autoValidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Search cannot be empty";
                    }
                    return null;
                  },
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<SearchbookCubit>(context)
                          .fetchSearchBooks(categoryName: textController.text);
                    } else {
                      autoValidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30, bottom: 16),
                child: Text(
                  "Search Result",
                  style: Styles.textstyle18,
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state is SearchInitial)
                    Center(
                      child: Center(
                        child: Text(
                          'Search For Show Books',
                          style:
                              Styles.textstyle20.copyWith(color: Colors.grey),
                        ),
                      ),
                    )
                  else if (state is SearchbookLoading)
                    const Center(child: CircularProgressIndicator()),
                  if (state is SearchbookSuccess)
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: SearchResultListView(
                              bookModel: state.books,
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (state is SearchbookFailure)
                    // print(state.message.toString());
                    CustomErrorWidget(
                        errorMessage: state.errormessage.toString()),
                ],
              ))
            ],
          ),
        );
      },
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({
    super.key,
    required this.bookModel,
  });
  final List<BookModel> bookModel;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: BookListViewItem(
              bookmodel: bookModel[index],
            ));
      },
      itemCount: bookModel.length,
    );
  }
}
