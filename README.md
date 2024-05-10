Here's the edited readme content to be responsive with the new example:

## JSON to Dart

This Dart package, **json_to_dart_class**, facilitates the generation of Dart class files from JSON data. It provides a convenient way to convert JSON structures into corresponding Dart classes, making it easier to work with JSON data in Dart applications.

## Installation

To use **json_to_dart_class** in your Dart project, add it to your `pubspec.yaml` file:

```yaml
dependencies:
  json_to_dart_class: ^1.0.0
```

Then, run `flutter pub get` to install the package.

## Usage

The package offers two main ways to generate Dart classes:

**1. Simple Usage:**

This approach is ideal for basic JSON structures. Below is an example demonstrating how to use it:

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

**2. Advanced Usage with Options:**

This approach provides more control over the generated code. Here's an example demonstrating advanced usage:

```dart
import 'package:json_to_dart_class/json_to_dart_class.dart';

void main() async {
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
        {
          "name": "Emily", 
          "age": 8 
        },
        {
          "name": "David", 
          "age": 5 
        },
        {
          "name": "Sarah", 
          "age": 12 
        }
      ]
    }
  };

  await jsonToDart(
    json: json,
    className: 'WeatherData', // Class name for the main structure
    library: 'weather',      // Library name for generated code
    folderPath: 'src/weather', // Folder path for generated files
  );
}
```

This will generate multiple class files:

- `weather_data.dart` containing the `WeatherData` class for the main structure.
- Nested classes for objects within the `feed` object (e.g., `Location`, `Child`).

## Features

- Generates Dart class files from JSON data
- Supports nested JSON structures
- Handles different data types (String, int, double, bool, List, Map)
- Offers options for advanced usage (library name, folder path)

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, feel free to open an issue or submit a pull request on [GitHub](https://github.com/yourusername/json_to_dart_class).

## License

This package is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

**Note:** This package is not affiliated with or endorsed by any other entity.
