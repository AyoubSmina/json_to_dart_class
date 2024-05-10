part of index;

void _generate$fromOriginJson(Map<dynamic, dynamic> json, StringBuffer buffer) {
  final List<String> constructorArgs = [];
  json.forEach((key, value) {
    if (value is Map) {
      constructorArgs.add(
          '\$${_toUpperCamelCaseKey(key)}: ${_toUpperCamelCase(key.toString())}Class.fromOriginJson(json[\'$key\']),');
    } else if (value is List) {
      if (value.isNotEmpty && value.first is Map) {
        constructorArgs.add(
            '\$${_toUpperCamelCaseKey(key)}: List.from(json[\'$key\']).map((item) => ${_toUpperCamelCase(key.toString())}ItemClass.fromOriginJson(item)).toList(),');
      } else {
        constructorArgs.add('\$${_toUpperCamelCaseKey(key)}: json[\'$key\'],');
      }
    } else {
      constructorArgs.add('\$${_toUpperCamelCaseKey(key)}: json[\'$key\'],');
    }
  });
  buffer.writeln('    ${constructorArgs.join('\n    ')}');
}
