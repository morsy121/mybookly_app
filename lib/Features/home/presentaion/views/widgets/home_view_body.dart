import 'package:bookly_app/Features/home/presentaion/views/widgets/best_seller_listview.dart';
import 'package:bookly_app/Features/home/presentaion/views/widgets/custom_appbar.dart';
import 'package:bookly_app/Features/home/presentaion/views/widgets/feature_list_view.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
             FeattureBookListView(),
              SizedBox(
                height: 45,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  "Newset Books",
                  style: Styles.textstyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: BestSellerListView(),
        ),
      ],
    );
  }
}
