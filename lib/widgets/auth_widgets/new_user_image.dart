import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:store/utils/constant/const_values.dart';
import 'package:store/utils/methods/app_methods.dart';
import 'package:image_picker/image_picker.dart';

class NewUserImage extends StatelessWidget {
  NewUserImage(
      {super.key,
      required this.title,
      this.onPressedCamera,
      this.onPressedGallery,
      this.onPressedRemove,
      required this.pickedImage});
  final String title;
  final void Function()? onPressedCamera;
  final void Function()? onPressedGallery;
  final void Function()? onPressedRemove;
  XFile? pickedImage;

  @override
  Widget build(BuildContext context) {
    final Color scaffoldBackgroundColor2 =
        Theme.of(context).scaffoldBackgroundColor;
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Material(
            elevation: 5,
            borderRadius: ConstValues.borderRadius,
            child: ClipRRect(
              borderRadius: ConstValues.borderRadius,
              child: pickedImage == null
                  ? Image.network(
                      'https://img.favpng.com/4/1/19/computer-icons-user-profile-computer-software-png-favpng-7ujTL6FqkdsYJh37sSpqEZgZH.jpg',
                      height: MediaQuery.of(context).size.height * 0.4,
                    )
                  : Image.file(
                      File(pickedImage!.path),
                      height: MediaQuery.of(context).size.height * 0.4,
                    ),
            ),
          ),
          Material(
            color: scaffoldBackgroundColor2,
            elevation: 10,
            borderRadius: ConstValues.borderRadius,
            child: IconButton(
              icon: Icon(
                Ionicons.camera_outline,
                color: Theme.of(context).dividerColor,
              ),
              onPressed: () async {
                return await AppMethods.showOptions(
                  context,
                  title: title,
                  onPressedRemove: onPressedRemove,
                  onPressedCamera: onPressedCamera,
                  onPressedGallery: onPressedGallery,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
