part of index;

void generateFields(Map<dynamic, dynamic> json, StringBuffer buffer) {
  json.forEach((key, value) {
    if (value is Map) {
      buffer.writeln(
          '  final ${toUpperCamelCase(key.toString())}Class \$${toUpperCamelCaseKey(key)};');
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
          type = '${toUpperCamelCase(key.toString())}ItemClass';
        }
      }
      buffer.writeln('  final List<$type> \$${toUpperCamelCaseKey(key)};');
    } else {
      buffer
          .writeln('  final ${getType(value)} \$${toUpperCamelCaseKey(key)};');
    }
  });
}
