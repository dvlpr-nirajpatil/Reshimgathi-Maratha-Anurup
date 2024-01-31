import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:reshimgathi/consts/consts.dart';

class PickedImages {
  List<XFile>? images = [];
  static const String key = 'xFilesKey';

  PickedImages() {
    fetch();
  }

  // Store the list of XFiles
  Future<void> store() async {
    final prefs = await SecureSharedPref.getInstance();

    // Convert the list to a JSON-encoded string
    String xFilesJson = jsonEncode(images!.map((xFile) => xFile.path).toList());

    // Store the JSON string in shared preferences
    prefs.putString(key, xFilesJson);
  }

  Future<void> fetch() async {
    final prefs = await SecureSharedPref.getInstance();

    // Retrieve the JSON string from shared preferences
    String? xFilesJson = await prefs.getString(key);

    if (xFilesJson != null && xFilesJson.isNotEmpty) {
      // Parse the JSON string back into a list of file paths
      List<String> filePaths = jsonDecode(xFilesJson).cast<String>();

      // Create XFile instances from the file paths
      List<XFile> xFiles = filePaths.map((path) => XFile(path)).toList();

      images = xFiles;
    } else {
      // Return an empty list if no data is found
      images = [];
    }
  }
}
