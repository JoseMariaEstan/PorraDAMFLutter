import 'package:flutter/material.dart';

/// Pantalla de entrada: pide alias y sala (PantallaSala en Kotlin).
class PantallaBienvenida extends StatefulWidget {
  const PantallaBienvenida({super.key, required this.onEntrar});

  /// Se llama con el alias cuando el usuario pulsa "Entrar en la porra".
  final ValueChanged<String> onEntrar;

  @override
  State<PantallaBienvenida> createState() => _PantallaBienvenidaState();
}

class _PantallaBienvenidaState extends State<PantallaBienvenida> {
  final _alias = TextEditingController();
  final _sala = TextEditingController();

  bool get _puedeEntrar =>
      _alias.text.trim().isNotEmpty && _sala.text.trim().isNotEmpty;

  @override
  void dispose() {
    _alias.dispose();
    _sala.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final etiqueta = tema.textTheme.bodyLarge?.copyWith(
      color: Colors.black.withValues(alpha: 0.85),
      fontWeight: FontWeight.w900,
    );

    // Scaffold transparente: deja ver el fondo y gestiona el teclado.
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, restricciones) => SingleChildScrollView(
            padding: const EdgeInsets.all(30),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: restricciones.maxHeight - 60,
              ),
              child: Column(
                // Arrangement.Bottom: todo pegado abajo
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text.rich(
                    const TextSpan(
                      text: 'Porra ',
                      children: [
                        TextSpan(
                          text: 'DAM',
                          style: TextStyle(color: Color(0xFFA5FFCF)),
                        ),
                      ],
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 55,
                    ),
                  ),
                  Text(
                    'Pronostica los partidos de cada jornada y compite con tu clase.\n¿Quién acertará más?',
                    style: tema.textTheme.bodyLarge?.copyWith(
                      color: Colors.white.withValues(alpha: 0.85),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: tema.colorScheme.surface.withValues(alpha: 0.92),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text('Tu alias', style: etiqueta),
                          ),
                          TextField(
                            controller: _alias,
                            onChanged: (_) => setState(() {}),
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              labelText: 'Escribe tu nombre o alias',
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text('Sala', style: etiqueta),
                          const SizedBox(height: 5),
                          TextField(
                            controller: _sala,
                            onChanged: (_) => setState(() {}),
                            decoration: const InputDecoration(
                              labelText: 'p. ej. 1A - DAM - 2026',
                              prefixIcon: Icon(Icons.people),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            height: 60,
                            child: FilledButton(
                              onPressed: _puedeEntrar
                                  ? () => widget.onEntrar(_alias.text.trim())
                                  : null,
                              style: FilledButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                              ),
                              child: const Text(
                                'Entrar en la porra ->',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
