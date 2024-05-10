part of index;

void generateConstructorParams(
    Map<dynamic, dynamic> json, StringBuffer buffer) {
  final Set<String> constructorParams = {};
  json.forEach((key, value) {
    if (value is Map) {
      buffer.writeln('    required this.\$${toUpperCamelCaseKey(key)},');
      constructorParams.add('this.\$${toUpperCamelCaseKey(key)}');
    } else if (value is List) {
      buffer.writeln('    required this.\$${toUpperCamelCaseKey(key)},');
      constructorParams.add('this.\$${toUpperCamelCaseKey(key)}');
    } else {
      buffer.writeln('    required this.\$${toUpperCamelCaseKey(key)},');
      constructorParams.add('this.\$${toUpperCamelCaseKey(key)},');
    }
  });
}
