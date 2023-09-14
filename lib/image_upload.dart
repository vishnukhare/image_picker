import 'package:flutter/material.dart';
import 'dart:io';

class ImageUploadScreen extends StatelessWidget {
  final File croppedImage;

  const ImageUploadScreen({super.key, required this.croppedImage});

  // Implement image uploading functionality here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Upload'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.file(
              croppedImage,
              width: 200.0,
              height: 200.0,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement image upload functionality
              },
              child: const Text('Upload Image'),
            ),
          ],
        ),
      ),
    );
  }
}
