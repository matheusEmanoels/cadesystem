import 'package:flutter/widgets.dart';

import 'app.dart';
import 'data/services/cade_database.dart';
import 'data/services/midia_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final midia = await MidiaService.criar();
  runApp(CadeApp(banco: CadeDatabase(), midia: midia));
}
