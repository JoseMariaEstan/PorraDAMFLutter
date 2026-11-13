import 'package:flutter/material.dart';

/// Círculo de color con las iniciales del equipo.
class EscudoEquipo extends StatelessWidget {
  const EscudoEquipo({
    super.key,
    required this.iniciales,
    required this.color,
    this.tamano = 36,
  });

  final String iniciales;
  final Color color;
  final double tamano;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: tamano,
      height: tamano,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Text(
        iniciales,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
