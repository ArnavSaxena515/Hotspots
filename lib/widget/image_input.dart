import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({
    Key? key,
  }) : super(key: key);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  Future<void> _addPicture({bool fromCamera = false}) async {
    final _imagePicker = ImagePicker();
    final imageFile = fromCamera
        ? await _imagePicker.pickImage(source: ImageSource.camera, maxWidth: 600)
        : await _imagePicker.pickImage(
            source: ImageSource.gallery,
            maxWidth: 600,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(15),
            height: 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(15)),
            child: Center(
                child: _storedImage != null
                    ? Image.file(
                        _storedImage!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      )
                    : Text(
                        "Upload image",
                        style: Theme.of(context).textTheme.bodyMedium,
                      )),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                  onPressed: () {
                    _addPicture();
                  },
                  icon: const Icon(Icons.camera),
                  label: Text(
                    "From Gallery",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  )),
              ElevatedButton.icon(
                  onPressed: () {
                    _addPicture(fromCamera: true);
                  },
                  icon: const Icon(Icons.camera),
                  label: Text(
                    "From Camera",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
