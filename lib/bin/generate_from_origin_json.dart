part of index;

void generate$fromOriginJson(Map<dynamic, dynamic> json, StringBuffer buffer) {
  final List<String> constructorArgs = [];
  json.forEach((key, value) {
    if (value is Map) {
      constructorArgs.add(
          '\$${toUpperCamelCaseKey(key)}: ${toUpperCamelCase(key.toString())}Class.fromOriginJson(json[\'$key\']),');
    } else if (value is List) {
      if (value.isNotEmpty && value.first is Map) {
        constructorArgs.add(
            '\$${toUpperCamelCaseKey(key)}: List.from(json[\'$key\']).map((item) => ${toUpperCamelCase(key.toString())}ItemClass.fromOriginJson(item)).toList(),');
      } else {
        constructorArgs.add('\$${toUpperCamelCaseKey(key)}: List.from(json[\'$key\'] ?? []),');
      }
    } else {
      constructorArgs.add('\$${toUpperCamelCaseKey(key)}: json[\'$key\'],');
    }
  });
  buffer.writeln('    ${constructorArgs.join('\n    ')}');
}
