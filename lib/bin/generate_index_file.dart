part of index;

void generateIndexFile(String library, folderPath) {
  try {
    final StringBuffer buffer = StringBuffer();

    // Write library directive
    buffer.writeln('library $library;');
    buffer.writeln();

    for (var element in generatedClassNames) {
      buffer.writeln("part '$element.dart';");
    }

    // Write to file
    final indexFileName = '$folderPath/index.dart';
    final indexFile = File(indexFileName);
    indexFile.writeAsStringSync(buffer.toString());

    print('Index file generated successfully: $indexFileName');
  } catch (_) {}
}
