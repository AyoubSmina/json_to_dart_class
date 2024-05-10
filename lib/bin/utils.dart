part of index;

String _getType(dynamic value) {
  if (value is String) {
    return 'String';
  } else if (value is int) {
    return 'int';
  } else if (value is double) {
    return 'double';
  } else if (value is bool) {
    return 'bool';
  } else if (value == null) {
    return 'dynamic';
  } else {
    throw ArgumentError('Unsupported type: ${value.runtimeType}');
  }
}

String _toUpperCamelCase(String input) {
  final Set<String> parts = input.split('_').toSet();
  return parts.map((part) {
    var el = part.toString().split('');
    if (el.isNotEmpty) {
      return el.first.toUpperCase() + part.substring(1);
    }
    return el.join('');
  }).join('');
}

String _toUpperCamelCaseKey(String input) {
  final List<String> parts = input.split('_');
  if (parts.length > 1) {
    var str = parts.first;
    str += parts.sublist(1).map((e) {
      if (e.length > 1) {
        return '${e[0].toUpperCase()}${e.substring(1)}';
      }
      return e;
    }).join('');

    return str;
  } else {
    return input;
  }
}

String convertToSnakeCase(String input) {
  String result = input.replaceAllMapped(RegExp(r'[A-Z]'), (match) {
    return "_${match.group(0)!.toLowerCase()}";
  });
  if (result.startsWith('_')) {
    result = result.substring(1);
  }
  return result;
}
