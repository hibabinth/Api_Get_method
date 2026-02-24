import 'package:flutter/material.dart';

const kBgDeep = Color.fromARGB(255, 234, 230, 221);
const kBgCard = Color.fromARGB(255, 87, 82, 49);
const kAccentCoffee = Color(0xFF6B4226);
const kAccentCream = Color.fromARGB(255, 220, 215, 209);
const kAccentGold = Color.fromARGB(255, 219, 206, 187);
const kSubtext = Color(0xFF9C8FA0);

class AppTheme {
  static ThemeData get theme => ThemeData(
    scaffoldBackgroundColor: kBgDeep,
    colorScheme: const ColorScheme.dark(
      primary: kAccentGold,
      secondary: kAccentCoffee,
      surface: kBgCard,
    ),
    fontFamily: 'Georgia',
  );
}
