part of index;

void generate$fromJson(Map<dynamic, dynamic> json, StringBuffer buffer) {
  final List<String> constructorArgs = [];
  json.forEach((key, value) {
    if (value is Map) {
      constructorArgs.add(
          '\$${toUpperCamelCaseKey(key)}: ${toUpperCamelCase(key.toString())}Class.fromJson(json[\'${toUpperCamelCaseKey(key)}\']),');
    } else if (value is List) {
      if (value.isNotEmpty && value.first is Map) {
        constructorArgs.add(
            '\$${toUpperCamelCaseKey(key)}: List.from(json[\'$key\']).map((item) => ${toUpperCamelCase(key.toString())}ItemClass.fromJson(item)).toList(),');
      } else {
        constructorArgs.add(
            '\$${toUpperCamelCaseKey(key)}: json[\'${toUpperCamelCaseKey(key)}\'],');
      }
    } else {
      constructorArgs.add(
          '\$${toUpperCamelCaseKey(key)}: json[\'${toUpperCamelCaseKey(key)}\'],');
    }
  });
  buffer.writeln('    ${constructorArgs.join('\n    ')}');
}
