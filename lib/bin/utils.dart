part of index;

String getType(dynamic value) {
  if (value is String) {
    return 'String';
  } else if (value is int) {
    // return 'int';
    return 'num';
  } else if (value is double) {
    // return 'double';
    return 'num';
  } else if (value is bool) {
    return 'bool';
  } else if (value == null) {
    return 'dynamic';
  } else {
    throw ArgumentError('Unsupported type: ${value.runtimeType}');
  }
}

String toUpperCamelCase(String input) {
  final Set<String> parts = input.split('_').toSet();
  var res = parts.map((part) {
    var el = part.toString().split('');
    if (el.isNotEmpty) {
      var firstChar = el.first;
      try {
        // check if first character is number
        int.parse(firstChar);
        return 'N' + el.first.toUpperCase() + part.substring(1);
      } catch (e) {
        return el.first.toUpperCase() + part.substring(1);
      }
    }
    return el.join('');
  }).join('');
  return removeAddons(res);
}

String toUpperCamelCaseKey(String input) {
  final List<String> parts = input.split('_');
  if (parts.length > 1) {
    var str = parts.first;
    str += parts.sublist(1).map((e) {
      if (e.length > 1) {
        return removeAddons('${e[0].toUpperCase()}${e.substring(1)}');
      }
      return removeAddons(e);
    }).join('');

    return removeAddons(str);
  } else {
    return removeAddons(input);
  }
}

String convertToSnakeCase(String input) {
  String result = input.replaceAllMapped(RegExp(r'[A-Z]'), (match) {
    return removeAddons("_${match.group(0)!.toLowerCase()}");
  });
  if (result.startsWith('_')) {
    result = result.substring(1);
  }
  return removeAddons(result);
}

String removeAddons(String str) =>
    str.replaceAll(':', r'_').replaceAll('-', r'_');
