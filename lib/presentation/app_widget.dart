import 'package:emoji_food/presentation/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emoji Food Ordering App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.notoSansTextTheme(),
      ),
      home: HomePage(),
    );
  }
}
