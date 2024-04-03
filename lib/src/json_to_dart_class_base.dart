// TODO: Put public facing types in this file.

/// Checks if you are awesome. Spoiler: you are.
import 'dart:io';

Set<String> generatedClassNames = {}; // Track generated class names

void jsonToDart(
    {required Map<dynamic, dynamic> json,
    required String className,
    required String folderPath}) {
  final StringBuffer buffer = StringBuffer();
  className = className[0].toUpperCase() + className.substring(1);
  var filename = convertToSnakeCase(className);
  // Generate class definition
  buffer.writeln(
      'part of $folderPath;'); // Added line to indicate this class is part of the library
  buffer.writeln();

  // Generate class definition
  buffer.writeln('class $className {');
  _generateFields(json, buffer);
  buffer.writeln();

  // Generate constructor
  buffer.writeln('  $className({');
  _generateConstructorParams(json, buffer);
  buffer.writeln('  });');
  buffer.writeln();

  // Generate fromJson method
  buffer.writeln('  factory $className.fromJson(Map<String, dynamic> json) {');
  buffer.writeln('    return $className(');
  _generateConstructorArgs(json, buffer);
  buffer.writeln('    );');
  buffer.writeln('  }');
  buffer.writeln('}');
  buffer.writeln();

  // Add generated class name to the list
  generatedClassNames.add(filename);

  // Generate child classes
  json.forEach((key, value) {
    if (value is Map) {
      jsonToDart(
          json: value,
          className: '${_toUpperCamelCase(key.toString())}Class',
          folderPath: folderPath);
    } else if (value is List) {
      if (value.isNotEmpty && value.first is Map) {
        jsonToDart(
          json: value.first,
          className: '${_toUpperCamelCase(key.toString())}ItemClass',
          folderPath: folderPath,
        );
      } else {
        // throw ArgumentError(
        //     'Unsupported list type for $key: ${value.runtimeType}');
      }
    }
  });

  // Write to file
  final classFileName = '$folderPath/$filename.dart';
  final classFile = File(classFileName);
  classFile.writeAsStringSync(buffer.toString());

  print('Dart class generated successfully: $classFileName');
  generateIndexFile(folderPath);
}

void _generateFields(Map<dynamic, dynamic> json, StringBuffer buffer) {
  json.forEach((key, value) {
    if (value is Map) {
      buffer.writeln(
          '  final ${_toUpperCamelCase(key.toString())}Class \$${_toUpperCamelCaseKey(key)};');
      // _generateFields(value, buffer);
    } else if (value is List) {
      var type = 'dynamic';
      if (value.isNotEmpty) {
        if (value.first is String) {
          type = 'String';
        } else if (value.first is int) {
          type = 'int';
        } else if (value.first is double) {
          type = 'double';
        } else if (value.first is bool) {
          type = 'bool';
        } else if (value.first == null) {
          type = 'dynamic';
        } else {
          type = '${_toUpperCamelCase(key.toString())}ItemClass';
        }
      }
      buffer.writeln('  final List<$type> \$${_toUpperCamelCaseKey(key)};');
      // if (value.isNotEmpty && value.first is Map) {
      //   _generateFields(value.first, buffer);
      // }
    } else {
      buffer.writeln(
          '  final ${_getType(value)} \$${_toUpperCamelCaseKey(key)};');
    }
  });
}

void _generateConstructorParams(
    Map<dynamic, dynamic> json, StringBuffer buffer) {
  final Set<String> constructorParams = {};
  json.forEach((key, value) {
    if (value is Map) {
      buffer.writeln('    required this.\$${_toUpperCamelCaseKey(key)},');
      constructorParams.add('this.\$${_toUpperCamelCaseKey(key)}');
      // _generateConstructorParams(value, buffer);
    } else if (value is List) {
      buffer.writeln('    required this.\$${_toUpperCamelCaseKey(key)},');
      constructorParams.add('this.\$${_toUpperCamelCaseKey(key)}');
    } else {
      buffer.writeln('    required this.\$${_toUpperCamelCaseKey(key)},');
      constructorParams.add('this.\$${_toUpperCamelCaseKey(key)},');
    }
  });
}

void _generateConstructorArgs(Map<dynamic, dynamic> json, StringBuffer buffer) {
  final List<String> constructorArgs = [];
  json.forEach((key, value) {
    if (value is Map) {
      constructorArgs.add(
          '\$${_toUpperCamelCaseKey(key)}: ${_toUpperCamelCase(key.toString())}Class.fromJson(json[\'${_toUpperCamelCaseKey(key)}\']),');
      // _generateConstructorArgs(value, buffer);
    } else if (value is List) {
      if (value.isNotEmpty && value.first is Map) {
        constructorArgs.add(
            '\$${_toUpperCamelCaseKey(key)}: List.from(json[\'$key\']).map((item) => ${_toUpperCamelCase(key.toString())}ItemClass.fromJson(item)).toList(),');
      } else {
        constructorArgs.add(
            '\$${_toUpperCamelCaseKey(key)}: json[\'${_toUpperCamelCaseKey(key)}\'],');
      }
    } else {
      constructorArgs.add(
          '\$${_toUpperCamelCaseKey(key)}: json[\'${_toUpperCamelCaseKey(key)}\'],');
    }
  });
  buffer.writeln('    ${constructorArgs.join('\n    ')}');
}

void _generateFBConstructorArgs(
    Map<dynamic, dynamic> json, StringBuffer buffer) {
  final List<String> constructorArgs = [];
  json.forEach((key, value) {
    if (value is Map) {
      constructorArgs.add(
          '\$${_toUpperCamelCaseKey(key)}: ${_toUpperCamelCase(key.toString())}Class.fromFBJson(json[\'$key\']),');
      // _generateConstructorArgs(value, buffer);
    } else if (value is List) {
      if (value.isNotEmpty && value.first is Map) {
        constructorArgs.add(
            '\$${_toUpperCamelCaseKey(key)}: List.from(json[\'$key\']).map((item) => ${_toUpperCamelCase(key.toString())}ItemClass.fromFBJson(item)).toList(),');
      } else {
        constructorArgs.add('\$${_toUpperCamelCaseKey(key)}: json[\'$key\'],');
      }
    } else {
      constructorArgs.add('\$${_toUpperCamelCaseKey(key)}: json[\'$key\'],');
    }
  });
  buffer.writeln('    ${constructorArgs.join('\n    ')}');
}

String _getType(dynamic value) {
  if (value is String) {
    return 'String';
  } else if (value is int) {
    return 'int';
  } else if (value is double) {
    return 'double';
  } else if (value is bool) {
    return 'bool';
  } else if (value == null) {
    return 'dynamic';
  } else {
    throw ArgumentError('Unsupported type: ${value.runtimeType}');
  }
}

// String _toUpperCamelCase(String input) {
//   final Set<String> parts = input.split('_').toSet();
//   return parts
//       .map((part) => part.substring(0, 1).toUpperCase() + part.substring(1))
//       .join('');
// }

String _toUpperCamelCase(String input) {
  final Set<String> parts = input.split('_').toSet();
  return parts.map((part) {
    var el = part.toString().split('');
    if (el.isNotEmpty) {
      return el.first.toUpperCase() + part.substring(1);
    }
    return el.join('');
  }).join('');
}

String _toUpperCamelCaseKey(String input) {
  final List<String> parts = input.split('_');
  if (parts.length > 1) {
    var str = parts.first;
    str += parts.sublist(1).map((e) {
      if (e.length > 1) {
        return '${e[0].toUpperCase()}${e.substring(1)}';
      }
      return e;
    }).join('');

    return str;
  } else {
    return input;
  }
}

void generateIndexFile(String folderPath) {
  final StringBuffer buffer = StringBuffer();

  // Write library directive
  buffer.writeln('library $folderPath;');
  buffer.writeln();

  // buffer.writeln("import 'generated_class2.dart';");
  // // Add import statements for other generated classes as needed

  // // Write parts directive
  // buffer.writeln();
  // buffer.writeln('part \'generated_class1.dart\';');
  // buffer.writeln('part \'generated_class2.dart\';');
  // Add part statements for other generated classes as needed
  for (var element in generatedClassNames) {
    buffer.writeln("part '$element.dart';");
  }

  // Write to file
  final indexFileName = '$folderPath/index.dart';
  final indexFile = File(indexFileName);
  indexFile.writeAsStringSync(buffer.toString());

  print('Index file generated successfully: $indexFileName');
}

String convertToSnakeCase(String input) {
  String result = input.replaceAllMapped(RegExp(r'[A-Z]'), (match) {
    return "_${match.group(0)!.toLowerCase()}";
  });
  if (result.startsWith('_')) {
    result = result.substring(1);
  }
  return result;
}
