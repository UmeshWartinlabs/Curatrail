import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:flutter/material.dart';

String formatDate({required DateTime date, String pattern = "dd-MM-yyyy"}) {
  return DateFormat(pattern).format(date);
}

Future<DateTime?> commonDatePicker({
  required BuildContext context,
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
}) async {
  final DateTime now = DateTime.now();

  return await showDatePicker(
    context: context,
    initialDate: initialDate ?? now,
    firstDate: firstDate ?? DateTime(1900),
    lastDate: lastDate ?? DateTime(2100),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: Colors.blue, // header background color
            onPrimary: Colors.white, // header text color
            onSurface: Colors.black, // body text color
          ),
          dialogBackgroundColor: Colors.white,
        ),
        child: child!,
      );
    },
  );
}

Future<XFile?> commonImagePicker({required ImageSource imageSource}) async {
  if (imageSource == ImageSource.camera) {
    if (!await requestCameraPermission()) return null;
  } else if (imageSource == ImageSource.gallery) {
    if (Platform.isIOS) {
      if (!await requestGalleryPermission()) return null;
    }
  }

  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: imageSource);

  if (pickedFile != null) {
    return pickedFile;
  }
  return null;
}

Future requestCameraPermission() async {
  PermissionStatus cameraPermission = await Permission.camera.request();
  if (cameraPermission.isGranted) {
    return true;
  } else if (cameraPermission.isDenied) {
    // cameraPermission = await Permission.camera.request();
    return false;
  } else if (cameraPermission.isPermanentlyDenied) {
    // await openAppSettings();
  } else {
    return await Permission.camera.request().isGranted;
  }
}

Future<bool> requestGalleryPermission() async {
  PermissionStatus galleryPermission = await Permission.photos.request();
  PermissionStatus storagePermission = await Permission.storage.request();

  // Handle iOS-specific cases
  if (Platform.isIOS) {
    if (galleryPermission.isGranted || galleryPermission.isLimited) {
      return true;
    } else if (galleryPermission.isDenied) {
      // cameraPermission = await Permission.camera.request();
      return false;
    } else if (galleryPermission.isPermanentlyDenied) {
      // await openAppSettings();
      return false;
    } else {
      return false;
    }
  }

  // Android handling
  if (galleryPermission.isGranted || storagePermission.isGranted) {
    return true;
  } else if (galleryPermission.isPermanentlyDenied) {
    // await openAppSettings();
    return false;
  } else {
    return false;
  }
}
