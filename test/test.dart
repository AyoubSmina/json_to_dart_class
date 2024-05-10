import 'package:json_to_dart_class/json_to_dart_class.dart';
import 'package:test/scaffolding.dart';

main() {
  group('test json to dart class', () {
    test('generate class', () async {
      var json = {
        "status": "success",
        "age": 32,
        "feed": {
          "len": 10,
          "wd": "Sunny",
          "speed": 25.0,
          "location": {
            "address": "123 Main Street",
            "postal_code": "12345",
            "city": "Miami",
          },
          "childs": [
            {"name": "Emily", "age": 8},
            {"name": "David", "age": 5},
            {"name": "Sarah", "age": 12}
          ]
        }
      };
      await jsonToDart(
          json: json,
          className: 'persson',
          library: 'persson',
          folderPath: 'src/persson');
    });
  });
}
