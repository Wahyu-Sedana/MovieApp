import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TabBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const TabBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      isScrollable: true,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white38,
      indicatorColor: Colors.white,
      tabs: [Tab(text: 'Popular Movie'), Tab(text: 'Cinema'), Tab(text: 'Coming Soon')],
    );
  }
}
