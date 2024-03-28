import 'package:flutter/material.dart';
import 'package:movie_ui/features/pages/popular_page.dart';
import 'package:movie_ui/features/pages/toprated_page.dart';
import 'package:movie_ui/features/pages/tv_page.dart';
import 'package:movie_ui/features/widgets/tab_widget.dart';
import 'package:movie_ui/src/repositories/popular_repository.dart';

import '../../src/utils/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: secondaryColor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.menu),
                SizedBox(width: 10),
                Text('Movies'),
                SizedBox(width: 10),
                Icon(Icons.search),
              ],
            ),
            bottom: const TabBarWidget(),
          ),
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [secondaryColor, primaryColor],
              ),
            ),
            child: TabBarView(
              children: [
                PopularPage(),
                TvPage(),
                TopRatedPage(),
              ],
            ),
          ),
        ));
  }
}
