import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store/utils/constant/const_values.dart';
import 'package:store/widgets/auth_widgets/custom_list_icons.dart';
import 'package:store/widgets/other_widgets/cutom_text.dart';

class ShowOptions extends StatelessWidget {
  const ShowOptions({
    super.key,
    required this.title,
    this.onPressedCamera,
    this.onPressedGallery,
    this.onPressedRemove,
  });
  final String title;
  final void Function()? onPressedCamera;
  final void Function()? onPressedGallery;
  final void Function()? onPressedRemove;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      actionsPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      titlePadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      shape: const OutlineInputBorder(
          borderRadius: ConstValues.borderRadius, borderSide: BorderSide.none),
      elevation: 5,
      contentPadding: const EdgeInsets.all(10),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: Center(
        child: CustomText(
          title: title,
          fontSize: 15,
        ),
      ),
      actions: [
        CustomListIcon(
          title: 'Camera',
          icon: IconlyBroken.camera,
          onPressed: onPressedCamera ?? () => Navigator.canPop(context),
        ),
        CustomListIcon(
          title: 'Gallery',
          icon: IconlyBroken.paperDownload,
          onPressed: onPressedGallery ?? () => Navigator.canPop(context),
        ),
        CustomListIcon(
          title: 'Remove',
          icon: IconlyBroken.delete,
          onPressed: onPressedRemove ?? () => Navigator.canPop(context),
        ),
      ],
    );
  }
}
