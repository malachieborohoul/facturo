
import 'package:flutter/material.dart';

const Color primary = Color(0xFF0284c7);
const Color secondary = Color(0xFF0ea5e9);
const Color textFieldBorder = Color(0xFFDADADA);
const Color textGrey = Color(0xFF9A9A9A);
const Color blueLight = Color(0xFF5A667D);
const Color textFieldBackground = Color(0xFFF1F1F1);
const Color textWhite = Color(0xFFFFFFFF);
const Color background = Color(0xFFf0f9ff);
const Color textBlack = Color(0xFF082f49);
const Color neutral = Color(0xFFe5e5e5);


final lightTheme = ThemeData(
    primaryColor: primary,
    colorScheme: const ColorScheme.light(),
   );

final darkTheme = ThemeData(
    primaryColor: darkPrimary,
    colorScheme: const ColorScheme.dark(),
   );

// final darkPrimary = Color(0xFF24344D); // Une nuance plus foncée de bleu
// final darkBackground = Color(0xFF1A1A1A); // Fond plus sombre

// final darkPrimary = Color(0xFF0A1B3D); // Nuance plus foncée de bleu
// final darkBackground = Color(0xFF101010); // Fond plus sombre
// final darkGradientStart = Color(0xFF19398B); // Début du dégradé plus foncé
// final darkGradientEnd = darkPrimary;

const darkPrimary = Color(0xFF0D1B30); // Nuance plus foncée de bleu
const darkBackground = Color(0xFF0A0E14); // Fond plus sombre
const darkGradientStart = Color(0xFF1A2A4D); // Début du dégradé plus foncé
const darkGradientEnd =
    darkPrimary; // Fin du dégradé correspond à la couleur principale

// // Couleurs en mode sombre
// final darkPrimary = Color(0xFF1E1E1E); // Gris anthracite
// final darkBackground = Color(0xFF121212); // Fond plus sombre
// final darkGradientStart = Color(0xFF333333); // Début du dégradé plus foncé
// final darkGradientEnd =
//     darkPrimary; // Fin du dégradé correspond à la couleur principale