import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/views_models/best_seller_list_view_item.dart';
import 'package:bookly_app/features/home/presentation/views/views_models/custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/views_models/featured_books_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomAppBar(),
          FeaturedBooksListView(),
          SizedBox(height: 50),
          Text("Best Seller", style: Styles.textStyle18),
          SizedBox(height: 12),

          BestSellerListViewItem(),
        ],
      ),
    );
  }
}
