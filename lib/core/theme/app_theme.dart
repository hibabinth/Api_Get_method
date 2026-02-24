import 'package:flutter/material.dart';

const kBgDeep = Color.fromARGB(255, 234, 230, 221);
const kBgCard = Color.fromARGB(255, 246, 245, 237);
const kAccentCoffee = Color.fromARGB(255, 103, 113, 201);
const kAccentCream = Color.fromARGB(255, 222, 111, 94);
const kAccentGold = Color.fromARGB(255, 70, 44, 17);
const kSubtext = Color.fromARGB(255, 54, 47, 109);

class AppTheme {
  static ThemeData get theme => ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 243, 241, 239),
    colorScheme: const ColorScheme.dark(
      primary: kAccentGold,
      secondary: kAccentCoffee,
      surface: kBgCard,
    ),
    fontFamily: 'Georgia',
  );
}
