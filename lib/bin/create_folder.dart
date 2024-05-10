part of index;

Future<void> createFolder(String folderName) async {
  final directoryPath = folderName;
  final directory = Directory(directoryPath);

  if (await directory.exists()) {
    // Handle existing folder (e.g., print a message)
    print('Folder "$folderName" already exists.');
  } else {
    // Create the directory
    await directory.create(recursive: true);
    print('Folder "$folderName" created successfully.');
  }
}
