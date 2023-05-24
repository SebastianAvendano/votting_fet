import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:votting/core/theme/colors_theme.dart';
import 'package:votting/core/utils/bottom_sheet_options.dart';

const double radiusCircle = 10;
const double sizeContainer = 125;

const optionsPhoto = [
  {
    "label": 'Tomar foto',
    "icon": Icons.photo_camera,
    "value": ImageSource.camera,
    "isCancel": false,
  },
  {
    "label": 'Elegir de galería',
    "icon": Icons.image,
    "value": ImageSource.gallery,
    "isCancel": false,
  },
  {
    "label": 'Cancelar',
    "icon": Icons.close,
    "value": null,
    "color": ColorsAppTheme.primaryColor,
    "isCancel": true,
  }
];

class CardSelectImage extends StatefulWidget {
  const CardSelectImage({
    Key? key,
    this.onClick,
    this.file = '',
    this.label = '',
    this.sizeIcon = 50,
    this.isActive = true,
  }) : super(key: key);

  final String? file;
  final String? label;
  final bool? isActive;
  final double? sizeIcon;
  final void Function(XFile)? onClick;

  @override
  State<CardSelectImage> createState() => _CardSelectImageState();
}

class _CardSelectImageState extends State<CardSelectImage> {
  XFile? file;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Column(
        children: [
          file != null || widget.file != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(radiusCircle),
                  child: Image(
                    image: file != null
                        ? FileImage(File(file!.path)) as ImageProvider
                        : NetworkImage(widget.file!),
                    fit: BoxFit.cover,
                    width: sizeContainer,
                    height: sizeContainer,
                  ),
                )
              : Container(
                  width: sizeContainer,
                  height: sizeContainer,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(radiusCircle),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    MaterialCommunityIcons.camera_outline,
                    size: widget.sizeIcon,
                    color: ColorsAppTheme.primaryColor,
                  ),
                ),
          SizedBox(height: widget.label!.isEmpty ? 0 : 15),
          widget.label!.isEmpty
              ? const SizedBox()
              : Text(
                  widget.label!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ],
      ),
    );
  }

  void _pickImage() async {
    if (widget.isActive!) {
      final ImagePicker picker = ImagePicker();

      final imageSource = await BottomSheetOptions.show(context, optionsPhoto);
      if (imageSource != null) {
        final XFile? selectedFile = await picker.pickImage(source: imageSource);
        if (selectedFile != null) {
          setState(() {
            file = selectedFile;
          });
          widget.onClick?.call(selectedFile);
        }
      }
      return null;
    }
  }
}
