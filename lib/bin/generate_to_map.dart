part of index;

void generate$toMap(Map<dynamic, dynamic> json, StringBuffer buffer) {
  final List<String> constructorArgs = [];
  json.forEach((key, value) {
    if (value is Map) {
      constructorArgs.add(
          '"${toUpperCamelCaseKey(key)}": \$${toUpperCamelCaseKey(key)}.toMap(),');
    } else if (value is List) {
      if (value.isNotEmpty && value.first is Map) {
        constructorArgs.add(
            '"${toUpperCamelCaseKey(key)}": List<${toUpperCamelCase(key.toString())}ItemClass>.from(\$${toUpperCamelCaseKey(key)}).map((item) => item.toMap()).toList(),');
      } else {
        constructorArgs.add(
            '"${toUpperCamelCaseKey(key)}": \$${toUpperCamelCaseKey(key)},');
      }
    } else {
      constructorArgs
          .add('"${toUpperCamelCaseKey(key)}": \$${toUpperCamelCaseKey(key)},');
    }
  });
  buffer.writeln('    ${constructorArgs.join('\n    ')}');
}
