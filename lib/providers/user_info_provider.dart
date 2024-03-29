import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store/models/user_info_model.dart';
import 'package:store/utils/constant/const_values.dart';

class UserInfoProvider with ChangeNotifier {
  UserInfoModel? userInfoModel;

  UserInfoModel? get userInfo {
    return userInfoModel;
  }

  Future<UserInfoModel?> getUserInfoModel(BuildContext context) async {
    if (FirebaseAuth.instance.currentUser == null) {
      return null;
    }
    final String uuid = FirebaseAuth.instance.currentUser!.uid;
    try {
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await FirebaseFirestore.instance.collection('users').doc(uuid).get();
      final Map<String, dynamic>? data = documentSnapshot.data();
      userInfoModel = UserInfoModel.fromjson(data!);
    } on FirebaseException catch (error) {
      if (!context.mounted) {
        return null;
      }
      showToast(
        error.code,
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
    } catch (error) {
      if (!context.mounted) return null;
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
    return userInfoModel;
  }
}
