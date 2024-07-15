part of index;

Future<void> generateBuffer(
    {required Map<dynamic, dynamic> json,
    required String className,
    required String library,
    required String folderPath}) async {
  final StringBuffer buffer = StringBuffer();
  className = className[0].toUpperCase() + className.substring(1);
  var filename = convertToSnakeCase(className);
  // Generate class definition
  buffer.writeln(
      'part of $library;'); // Added line to indicate this class is part of the library
  buffer.writeln();

  // Generate class definition
  buffer.writeln('class $className {');
  generateFields(json, buffer);
  buffer.writeln();

  // Generate constructor
  if (json.isNotEmpty) {
    buffer.writeln('  $className({');
    generateConstructorParams(json, buffer);
    buffer.writeln('  });');
    buffer.writeln();
  } else {
    buffer.writeln('  $className();');
    buffer.writeln();
  }

  // Generate fromJson method
  buffer.writeln('  factory $className.fromJson(Map<String, dynamic> json) {');
  buffer.writeln('    return $className(');
  generate$fromJson(json, buffer);
  buffer.writeln('    );');
  buffer.writeln('  }');
  buffer.writeln();

  // Generate fromOriginJson method
  buffer.writeln(
      '  factory $className.fromOriginJson(Map<String, dynamic> json) {');
  buffer.writeln('    return $className(');
  generate$fromOriginJson(json, buffer);
  buffer.writeln('    );');
  buffer.writeln('  }');
  buffer.writeln();

  // Generate toMap method
  buffer.writeln('  Map<String,dynamic> toMap() {');
  buffer.writeln('    return {');
  generate$toMap(json, buffer);
  buffer.writeln('    };');
  buffer.writeln('  }');
  buffer.writeln('}');
  buffer.writeln();

  // Add generated class name to the list
  generatedClassNames.add(filename);

  // Generate child classes
  json.forEach((key, value) {
    if (value is Map) {
      generateBuffer(
          json: value,
          library: library,
          className: '${toUpperCamelCase(key.toString())}Class',
          folderPath: folderPath);
    } else if (value is List) {
      if (value.isNotEmpty && value.first is Map) {
        generateBuffer(
          json: value.first,
          library: library,
          className: '${toUpperCamelCase(key.toString())}ItemClass',
          folderPath: folderPath,
        );
      }
    }
  });

  // Write to file
  final classFileName = '$folderPath/$filename.dart';
  final classFile = File(classFileName);
  classFile.writeAsStringSync(buffer.toString());
}
