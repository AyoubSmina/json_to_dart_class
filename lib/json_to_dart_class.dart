library;

import 'package:json_to_dart_class/bin/index.dart';

Future jsonToDart(
    {required Map<dynamic, dynamic> json,
    required String className,
    required String library,
    required String folderPath}) async {
  await createFolder(folderPath);
  await generateBuffer(
    json: json,
    className: className,
    library: library,
    folderPath: folderPath,
  );
  generateIndexFile(library, folderPath);
}
