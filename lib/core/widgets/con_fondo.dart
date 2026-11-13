import 'package:flutter/material.dart';

/// Imagen de fondo a pantalla completa (FondoPantalla en Kotlin).
class FondoPantalla extends StatelessWidget {
  const FondoPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/fondo_pantalla_hd.webp',
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }
}

/// Pone el fondo, una capa oscura encima y luego el contenido.
class ConFondo extends StatelessWidget {
  const ConFondo({super.key, required this.child, this.oscurecer = 0.35});

  final Widget child;
  final double oscurecer;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const FondoPantalla(),
        // Capa oscura para que el texto blanco se lea sobre la foto
        ColoredBox(color: Colors.black.withValues(alpha: oscurecer)),
        child,
      ],
    );
  }
}
