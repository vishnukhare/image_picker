import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'image_upload.dart';
import 'dart:io';

class ImageCropScreen extends StatefulWidget {
  final File imageFile;

  const ImageCropScreen({super.key, required this.imageFile});

  @override
  _ImageCropScreenState createState() => _ImageCropScreenState();
}

class _ImageCropScreenState extends State<ImageCropScreen> {
  File? _croppedImageFile;

  Future<void> _cropImage() async {
    final croppedImage = await ImageCropper()
        .cropImage(sourcePath: widget.imageFile.path, aspectRatioPresets: [
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9,
    ], uiSettings: [
      AndroidUiSettings(
        toolbarTitle: 'Crop Image',
        toolbarColor: Colors.blue,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false,
      ),
      IOSUiSettings(
        title: 'Crop Image',
      )
    ]);

    if (croppedImage != null) {
      setState(() {
        _croppedImageFile = croppedImage as File?;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Crop'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.file(
              widget.imageFile,
              width: 200.0,
              height: 200.0,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _cropImage(),
              child: const Text('Crop Image'),
            ),
            const SizedBox(height: 20),
            if (_croppedImageFile != null)
              Image.file(
                _croppedImageFile!,
                width: 200.0,
                height: 200.0,
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_croppedImageFile != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ImageUploadScreen(croppedImage: _croppedImageFile!),
                    ),
                  );
                }
              },
              child: const Text('Upload Cropped Image'),
            ),
          ],
        ),
      ),
    );
  }
}
