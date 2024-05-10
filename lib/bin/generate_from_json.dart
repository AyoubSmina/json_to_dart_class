part of index;

void _generate$fromJson(Map<dynamic, dynamic> json, StringBuffer buffer) {
  final List<String> constructorArgs = [];
  json.forEach((key, value) {
    if (value is Map) {
      constructorArgs.add(
          '\$${_toUpperCamelCaseKey(key)}: ${_toUpperCamelCase(key.toString())}Class.fromJson(json[\'${_toUpperCamelCaseKey(key)}\']),');
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
