part of index;

void _generateFields(Map<dynamic, dynamic> json, StringBuffer buffer) {
  json.forEach((key, value) {
    if (value is Map) {
      buffer.writeln(
          '  final ${_toUpperCamelCase(key.toString())}Class \$${_toUpperCamelCaseKey(key)};');
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
    } else {
      buffer.writeln(
          '  final ${_getType(value)} \$${_toUpperCamelCaseKey(key)};');
    }
  });
}
