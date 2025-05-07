import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';

void main() {
  // Garanta que o Flutter tenha sido inicializado antes de chamar qualquer coisa que interaja com o sistema
  WidgetsFlutterBinding.ensureInitialized();

  // Impede a rotação da tela
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(App());
}
