import 'package:flutter/material.dart';

/// Botones − / + con el número de goles en medio.
class MarcadorSelector extends StatelessWidget {
  const MarcadorSelector({
    super.key,
    required this.goles,
    required this.onCambio,
  });

  final int goles;
  final ValueChanged<int> onCambio;

  @override
  Widget build(BuildContext context) {
    final texto = Theme.of(context).textTheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        _BotonMarcador(
          simbolo: '−',
          onPressed: goles > 0 ? () => onCambio(goles - 1) : null,
        ),
        SizedBox(
          width: 28,
          child: Text(
            '$goles',
            textAlign: TextAlign.center,
            style: texto.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        _BotonMarcador(
          simbolo: '+',
          onPressed: () => onCambio(goles + 1),
        ),
      ],
    );
  }
}

class _BotonMarcador extends StatelessWidget {
  const _BotonMarcador({required this.simbolo, required this.onPressed});

  final String simbolo;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints.tightFor(width: 32, height: 32),
      icon: Text(simbolo, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}
