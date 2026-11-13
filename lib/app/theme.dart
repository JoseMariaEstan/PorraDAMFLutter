import 'package:flutter/material.dart';

/// Color semilla: el mismo morado (Purple40) que usa el tema de Kotlin.
const colorSemilla = Color(0xFF6650A4);

/// Tema de la app. Como en Type.kt, solo bodyLarge usa la fuente Boldonse.
ThemeData temaPorra(Brightness brillo) {
  final base = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: colorSemilla,
      brightness: brillo,
    ),
  );

  return base.copyWith(
    textTheme: base.textTheme.copyWith(
      bodyLarge: base.textTheme.bodyLarge?.copyWith(
        fontFamily: 'Boldonse',
        fontWeight: FontWeight.normal,
        fontSize: 16,
        height: 1.5, // lineHeight 24 / fontSize 16
        letterSpacing: 0.5,
      ),
    ),
  );
}
