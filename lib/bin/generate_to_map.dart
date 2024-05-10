part of index;


void _generate$toMap(Map<dynamic, dynamic> json, StringBuffer buffer) {
  final List<String> constructorArgs = [];
  json.forEach((key, value) {
    if (value is Map) {
      constructorArgs.add(
          '"${_toUpperCamelCaseKey(key)}": \$${_toUpperCamelCaseKey(key)}.toMap(),');
    } else if (value is List) {
      if (value.isNotEmpty && value.first is Map) {
        constructorArgs.add(
            '"${_toUpperCamelCaseKey(key)}": List<${_toUpperCamelCase(key.toString())}ItemClass>.from(\$${_toUpperCamelCaseKey(key)}).map((item) => item.toMap()).toList(),');
      } else {
        constructorArgs.add(
            '"${_toUpperCamelCaseKey(key)}": \$${_toUpperCamelCaseKey(key)},');
      }
    } else {
      constructorArgs.add(
          '"${_toUpperCamelCaseKey(key)}": \$${_toUpperCamelCaseKey(key)},');
    }
  });
  buffer.writeln('    ${constructorArgs.join('\n    ')}');
}
