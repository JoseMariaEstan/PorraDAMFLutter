import 'package:flutter/material.dart';

/// Pestañas de la barra inferior (equivale al enum Pestanas de Kotlin).
enum Destino {
  jornada('Jornada', Icons.date_range),
  resultados('Resultados', Icons.check_circle),
  clasificacion('Clasificación', Icons.star);

  const Destino(this.titulo, this.icono);

  final String titulo;
  final IconData icono;
}
