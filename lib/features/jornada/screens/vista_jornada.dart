import 'package:flutter/material.dart';

import '../../../core/data/datos_ejemplo.dart';
import '../../../core/models/partido.dart';
import '../widgets/partido_card.dart';

/// Pestaña Jornada: un PartidoCard por partido para poner el pronóstico.
class VistaJornada extends StatefulWidget {
  const VistaJornada({super.key, required this.alias});

  final String alias;

  @override
  State<VistaJornada> createState() => _VistaJornadaState();
}

class _VistaJornadaState extends State<VistaJornada> {
  /// Pronóstico de cada partido, por id.
  final Map<int, Pronostico> _pronosticos = {
    for (final p in partidosJornada2) p.id: const Pronostico(),
  };

  void _cambiar(int id, Pronostico nuevo) =>
      setState(() => _pronosticos[id] = nuevo);

  @override
  Widget build(BuildContext context) {
    final texto = Theme.of(context).textTheme;
    final colores = Theme.of(context).colorScheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          'Jornada 2',
          style: texto.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          'Hola, ${widget.alias}. Pon tu pronóstico para cada partido.',
          style: texto.bodyMedium?.copyWith(color: colores.onSurfaceVariant),
        ),
        const SizedBox(height: 12),
        for (final partido in partidosJornada2) ...[
          PartidoCard(
            partido: partido,
            pronostico: _pronosticos[partido.id]!,
            onCambioLocal: (g) => _cambiar(
                partido.id, _pronosticos[partido.id]!.copyWith(golesLocal: g)),
            onCambioVisitante: (g) => _cambiar(partido.id,
                _pronosticos[partido.id]!.copyWith(golesVisitante: g)),
          ),
          const SizedBox(height: 12),
        ],
        SizedBox(
          height: 56,
          child: FilledButton.icon(
            onPressed: () {/* de momento no hace nada */},
            icon: const Icon(Icons.save),
            label: Text('Guardar pronósticos', style: texto.titleMedium),
          ),
        ),
      ],
    );
  }
}
