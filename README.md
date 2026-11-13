# Porra DAM (Flutter)

Versión en Flutter de [PorraDamKotlin](https://github.com/JoseMariaEstan/PorraDamKotlin): la misma app (bienvenida con alias y sala, y las pestañas Jornada, Resultados y Clasificación) hecha con Dart.

## Primera vez: generar la carpeta `android/`

El repositorio solo guarda el código Dart y los recursos. Las carpetas de plataforma se generan con **tu** versión de Flutter, desde la raíz del proyecto:

```bash
flutter create --org org.elcampico --project-name porra_dam --platforms android .
flutter pub get
flutter run
```

`flutter create .` **no sobrescribe** lo que ya existe (`lib/`, `pubspec.yaml`, `test/`): solo añade lo que falta.

## Estructura

```
lib/
├─ main.dart
├─ app/                     app.dart, theme.dart, porra_app.dart
│  └─ shell/                destinos.dart (pestañas), pantalla_principal.dart (Scaffold + NavigationBar)
├─ core/
│  ├─ models/               equipo.dart, partido.dart
│  ├─ data/                 datos_ejemplo.dart (datos fijos)
│  └─ widgets/              con_fondo.dart, escudo_equipo.dart, marcador_selector.dart
└─ features/
   ├─ bienvenida/screens/   pantalla_bienvenida.dart
   ├─ jornada/              screens/vista_jornada.dart, widgets/partido_card.dart
   ├─ resultados/           screens/vista_resultados.dart, widgets/partido_resultado_card.dart
   └─ clasificacion/        screens/vista_clasificacion.dart, widgets/fila_clasificacion.dart
```

## Correspondencia con la versión Kotlin

| Kotlin (Compose) | Flutter |
|---|---|
| `MainActivity` + `Porra_damTheme` | `app/app.dart` + `app/theme.dart` |
| `PorraApp` | `app/porra_app.dart` |
| `Pestanas` | `app/shell/destinos.dart` |
| `PantallaPrincipal` (+ `BackHandler`) | `app/shell/pantalla_principal.dart` (+ `PopScope`) |
| `PantallaBienvenida` / `PantallaSala` | `features/bienvenida/screens/pantalla_bienvenida.dart` |
| `Jornada` | `features/jornada/screens/vista_jornada.dart` |
| `Resultados` | `features/resultados/screens/vista_resultados.dart` |
| `Clasificacion` | `features/clasificacion/screens/vista_clasificacion.dart` |
| `ConFondo` / `FondoPantalla` | `core/widgets/con_fondo.dart` |
| `EscudoEquipo`, `MarcadorSelector` | `core/widgets/` |
| `PartidoCard`, `PartidoResultadoCard`, `FilaClasificacion` | `widgets/` de cada feature |
| `res/font/boldonse_regular.ttf` | `assets/fonts/Boldonse-Regular.ttf` |
| `res/drawable-nodpi/fondo_pantalla_hd.webp` | `assets/images/fondo_pantalla_hd.webp` |
