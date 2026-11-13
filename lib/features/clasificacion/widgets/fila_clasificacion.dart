import 'package:flutter/material.dart';

/// Una fila de la clasificación. Si es el usuario, se resalta.
class FilaClasificacion extends StatelessWidget {
  const FilaClasificacion({
    super.key,
    required this.posicion,
    required this.alias,
    required this.puntos,
    this.esYo = false,
  });

  final int posicion;
  final String alias;
  final int puntos;
  final bool esYo;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final primario = tema.colorScheme.primary;
    final colorTexto = esYo ? primario : tema.colorScheme.onSurface;

    return Material(
      color: esYo
          ? primario.withValues(alpha: 0.12)
          : tema.colorScheme.surface,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            SizedBox(
              width: 32,
              child: Text(
                '$posicion',
                style: tema.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorTexto,
                ),
              ),
            ),
            Expanded(
              child: Text(
                esYo ? '$alias (tú)' : alias,
                style: tema.textTheme.bodyLarge?.copyWith(
                  fontWeight: esYo ? FontWeight.bold : FontWeight.normal,
                  color: colorTexto,
                ),
              ),
            ),
            Text(
              '$puntos pts',
              style: tema.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorTexto,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
