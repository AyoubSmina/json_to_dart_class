# JSON to Dart

This Dart package, **json_to_dart_class**, facilitates the generation of Dart class files from JSON data. It provides a convenient way to convert JSON structures into corresponding Dart classes, making it easier to work with JSON data in Dart applications.

## Installation

To use **json_to_dart_class** in your Dart project, add it to your `pubspec.yaml` file:

```yaml
dependencies:
  json_to_dart_class: ^1.0.0
```

Then, run `flutter pub get` to install the package.

## Usage

Below is an example demonstrating how to use **json_to_dart_class** to generate Dart classes from JSON data:

```dart
import 'package:json_to_dart_class/json_to_dart_class.dart';

void main() {
  // Define your JSON data
  Map<dynamic, dynamic> json = {
    'name': 'John Doe',
    'age': 30,
    'isStudent': false,
    'address': {
      'city': 'New York',
      'zip': '10001'
    },
    'hobbies': ['Reading', 'Traveling']
  };

  // Specify class name and folder path for generated files
  String className = 'Person';
  String folderPath = 'lib/models';

  // Generate Dart class file
  jsonToDart(
    json: json,
    className: className,
    folderPath: folderPath,
  );
}
```

This will generate a Dart class file named `person.dart` inside the specified folder (`lib/models`) with the corresponding Dart class for the provided JSON structure.

## Features

- Generates Dart class files from JSON data
- Supports nested JSON structures
- Handles different data types (String, int, double, bool, List, Map)

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, feel free to open an issue or submit a pull request on [GitHub](https://github.com/yourusername/json_to_dart_class).

## License

This package is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

**Note:** This package is not affiliated with or endorsed by any other entity.