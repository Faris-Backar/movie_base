import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:movie_base/di/get_it.dart';
import 'package:movie_base/movie_base_app.dart';
import 'package:path_provider/path_provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  runApp(const MovieBaseApp());
}
