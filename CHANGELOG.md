
## 1.2.0

**New features:**

- **`toMap` method:** Added a `toMap` method to generated classes, allowing easy conversion of the class instance back to a Dart Map object.
- **Code formatting:** Improved code formatting for better readability and maintainability.
- **Automatic folder creation:** The `jsonToDart` function now accepts a folder path argument. If the specified folder doesn't exist, it will be automatically created before generating the class files.

**Example:**

```dart
await jsonToDart(
  json: json,
  className: 'WeatherData',
  library: 'weather',
  folderPath: 'lib/bin/weather', // New folder will be created if it doesn't exist
);
```


## 1.1.0

- Add fromOriginJson method.

## 1.0.0

- Initial version.
