import 'package:flutter/material.dart';
import 'package:movie_app/Features/Home/presentation/views/widgets/CoustomAppBar.dart';
import 'package:movie_app/Features/Home/presentation/views/widgets/FeatureBookLestView.dart';
import 'package:movie_app/Features/Home/presentation/views/widgets/BestSellerListView.dart';
import 'package:movie_app/core/utils/Style.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CoustomAppBar(),
              ),
              FeatureBookLestView(),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text('Newest Books', style: Styles.titleMedium),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: BestSallerListView(),
          ),
        ),
      ],
    );
  }
}
