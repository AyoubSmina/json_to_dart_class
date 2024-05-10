part of index;

void _generateConstructorParams(
    Map<dynamic, dynamic> json, StringBuffer buffer) {
  final Set<String> constructorParams = {};
  json.forEach((key, value) {
    if (value is Map) {
      buffer.writeln('    required this.\$${_toUpperCamelCaseKey(key)},');
      constructorParams.add('this.\$${_toUpperCamelCaseKey(key)}');
    } else if (value is List) {
      buffer.writeln('    required this.\$${_toUpperCamelCaseKey(key)},');
      constructorParams.add('this.\$${_toUpperCamelCaseKey(key)}');
    } else {
      buffer.writeln('    required this.\$${_toUpperCamelCaseKey(key)},');
      constructorParams.add('this.\$${_toUpperCamelCaseKey(key)},');
    }
  });
}
