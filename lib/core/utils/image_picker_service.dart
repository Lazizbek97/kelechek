import 'dart:developer';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

Future<File?> pickImage() async {
  try {
    final permission = await Permission.photos.request();
    if (permission.isDenied || permission.isPermanentlyDenied) {
      log('Permission.photos denied');
      return null;
    }
    final xFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (xFile != null) {
      return File(xFile.path);
    }
    return null;
  } catch (e) {
    log('pickImage error: $e');
    return null;
  }
}
