import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class Wynik {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<List<String>> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      List<String> contents = await file.readAsLines();

      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return [];
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter\n', mode: FileMode.append);
  }
}
