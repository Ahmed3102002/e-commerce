import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/user_info_provider.dart';
import 'package:store/utils/constant/const_values.dart';
import 'package:store/widgets/auth_widgets/show_options.dart';
import 'package:store/widgets/other_widgets/show_dialog.dart';

class AppMethods {
  static Future<void> getUser(BuildContext context) async {
    UserInfoProvider userProvider = Provider.of<UserInfoProvider>(context);
    try {
      await userProvider.getUserInfoModel(context);
    } catch (error) {
      if (!context.mounted) return;
      showToast(
        error.toString(),
        textStyle: GoogleFonts.abrilFatface(
          color: Theme.of(context).dividerColor,
        ),
        borderRadius: ConstValues.borderRadius,
        context: context,
        animation: StyledToastAnimation.rotate,
        reverseAnimation: StyledToastAnimation.fade,
        position: StyledToastPosition.bottom,
        animDuration: const Duration(milliseconds: 500),
        duration: const Duration(seconds: 2),
        curve: Curves.elasticOut,
        reverseCurve: Curves.linear,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      );
    }
  }

  static Future<void> showMessageDialog(
      {required BuildContext context,
      required final String message,
      final bool? isError,
      final void Function()? onPressed,
      final String? titl1,
      final String? title2}) async {
    await showDialog(
        context: context,
        builder: (context) {
          return ShowDialog(
            title1: titl1 ?? 'Cancel',
            title2: title2 ?? 'Ok',
            dialogMessage: message,
            isError: isError ?? false,
            onPressed: () async {
              onPressed != null ? onPressed() : Navigator.pop(context);
            },
          );
        });
  }

  static Future<void> showOptions(BuildContext context,
      {required String title,
      final void Function()? onPressedCamera,
      final void Function()? onPressedGallery,
      final void Function()? onPressedRemove}) {
    return showDialog(
      context: context,
      builder: (context) {
        return ShowOptions(
          title: title,
          onPressedCamera: onPressedCamera,
          onPressedGallery: onPressedGallery,
          onPressedRemove: onPressedRemove,
        );
      },
    );
  }
}
