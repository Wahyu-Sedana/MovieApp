import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_ui/features/pages/detail_page.dart';
import 'package:movie_ui/features/pages/home_page.dart';
import 'package:movie_ui/src/providers/detail_provider.dart';
import 'package:movie_ui/src/providers/home_provider.dart';
import 'package:provider/provider.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => DetailProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        routes: {'/home': (context) => HomePage(), '/detail': (context) => DetailPage()},
      ),
    );
  }
}
