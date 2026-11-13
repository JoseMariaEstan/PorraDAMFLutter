import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:porra_dam/app/app.dart';

void main() {
  testWidgets('Entrar en la porra lleva a la pantalla de Jornada',
      (tester) async {
    await tester.pumpWidget(const App());

    // El botón empieza deshabilitado hasta rellenar alias y sala.
    expect(find.text('Entrar en la porra ->'), findsOneWidget);

    await tester.enterText(find.byType(TextField).at(0), 'JM');
    await tester.enterText(find.byType(TextField).at(1), '2A - DAM - 2026');
    await tester.pump();

    await tester.tap(find.text('Entrar en la porra ->'));
    await tester.pumpAndSettle();

    expect(find.text('Jornada 2'), findsOneWidget);
    expect(find.textContaining('Hola, JM'), findsOneWidget);
  });
}
