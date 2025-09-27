import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/utils/app_router.dart';
import 'package:movie_app/core/utils/assets.dart';

class CoustomAppBar extends StatelessWidget {
  const CoustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35, bottom: 30),
      child: Row(
        children: [
          SvgPicture.asset(assetsData.logo, height: 60, width: 40),
          const Spacer(),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.KSearchView);
            },
            icon: const Icon(Icons.search_rounded, size: 28),
          ),
        ],
      ),
    );
  }
}
