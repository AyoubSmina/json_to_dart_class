import 'package:json_to_dart_class/json_to_dart_class.dart';
import 'package:test/scaffolding.dart';

main() {
  group('test json to dart class', () {
    test('generate class', ()async {
      var json = {"status": "ok", "age": 23 , "feed":{
        "len":120,
        "wd":"WeeeD",
        "speed":199.33,
        "location":{
          "adress":"Here here",
          "post":12334,
          "city":"florida",
        },
          "child":[
            {"name": "kamal", "age": 42},
            {"name": "alal", "age": 2},
            {"name": "malak", "age": 22},
          ]
      }};
     await jsonToDart(json: json, className: 'persson', library:'persson', folderPath: 'lib/bin/persson');
    });
  });
}
