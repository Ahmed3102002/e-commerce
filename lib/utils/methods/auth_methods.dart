import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:store/models/user_info_model.dart';
import 'package:store/pages/auth_pages/log_in_page.dart';
import 'package:store/providers/is_loading_provider.dart';
import 'package:store/root_of_pages.dart';
import 'package:store/utils/constant/const_values.dart';
import 'package:store/utils/methods/app_methods.dart';
import 'package:store/widgets/other_widgets/show_dialog.dart';

class AuthMethods {
  static Future<void> signUpMethod(
      {required IsLoadingProvider isLoading,
      required BuildContext context,
      required GlobalKey<FormState> formKey,
      required XFile? pickedImage,
      required String name,
      required String email,
      required String password}) async {
    {
      if (formKey.currentState!.validate() || pickedImage != null) {
        try {
          isLoading.isLoadingChange;
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
          String uuid = FirebaseAuth.instance.currentUser!.uid;
          final ref = FirebaseStorage.instance.ref('usersImages').child(uuid);
          await ref.putFile(File(pickedImage!.path));
          String userImage = await ref.getDownloadURL();
          await FirebaseFirestore.instance
              .collection('users')
              .doc(uuid)
              .set(UserInfoModel(
                userId: uuid,
                userName: name,
                userCart: [],
                userEmail: email,
                userImage: userImage,
                userFavouriteList: [],
                createdAt: Timestamp.now(),
              ).toJson());
          if (!context.mounted) return;
          showToast(
            'Your Account is created Successfully',
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
          isLoading.isLoadingChange;
          await Navigator.pushNamed(context, RootOfPages.routName);
        } on FirebaseAuthException catch (error) {
          isLoading.isLoadingChange;
          log(error.code);
          if (!context.mounted) return;
          await AppMethods.showMessageDialog(
              context: context, message: error.message!, isError: true);
        } catch (error) {
          isLoading.isLoadingChange;
          log(error.toString());
          if (!context.mounted) return;
          await AppMethods.showMessageDialog(
              context: context, message: error.toString(), isError: true);
        }
      }
      if (pickedImage == null) {
        if (!context.mounted) return;
        showDialog(
          context: context,
          builder: (context) => ShowDialog(
            dialogMessage: 'Make sure to pick up an image',
            isError: true,
            onPressed: () async {
              return Navigator.pop(context);
            },
          ),
        );
      }
    }
  }

  static Future<void> logInMethod({
    required IsLoadingProvider isLoading,
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    required String email,
    required String password,
  }) async {
    {
      if (formKey.currentState!.validate()) {
        isLoading.isLoadingChange;
        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
          isLoading.isLoadingChange;
          if (!context.mounted) return;

          if (!context.mounted) return;
          Navigator.pushReplacementNamed(context, RootOfPages.routName);
        } on FirebaseAuthException catch (error) {
          isLoading.isLoadingChange;
          if (!context.mounted) return;
          await AppMethods.showMessageDialog(
              context: context, message: error.code, isError: true);
        } catch (error) {
          isLoading.isLoadingChange;
          log(error.toString());
          if (!context.mounted) return;
          await AppMethods.showMessageDialog(
              context: context, message: error.toString(), isError: true);
        }
      }
    }
  }

  static Future<void> logInWithGoogleMethod({
    required IsLoadingProvider isLoading,
    required BuildContext context,
  }) async {
    {
      final GoogleSignInAccount? googleAccount = await GoogleSignIn().signIn();
      if (googleAccount != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleAccount.authentication;
        if (googleAuth.accessToken != null && googleAuth.idToken != null) {
          try {
            isLoading.isLoadingChange;
            UserCredential userCredential =
                await FirebaseAuth.instance.signInWithCredential(
              GoogleAuthProvider.credential(
                accessToken: googleAuth.accessToken,
                idToken: googleAuth.idToken,
              ),
            );
            if (userCredential.additionalUserInfo!.isNewUser) {
              await FirebaseFirestore.instance
                  .collection('users')
                  .doc(userCredential.user!.uid)
                  .set(UserInfoModel(
                    userId: userCredential.user!.uid,
                    userName: userCredential.user!.displayName!,
                    userCart: [],
                    userEmail: userCredential.user!.email!,
                    userImage: userCredential.user!.photoURL!,
                    userFavouriteList: [],
                    createdAt: Timestamp.now(),
                  ).toJson());
            }
            isLoading.isLoadingChange;
            if (!context.mounted) return;
            Navigator.pushReplacementNamed(context, RootOfPages.routName);
          } on FirebaseException catch (error) {
            isLoading.isLoadingChange;
            if (!context.mounted) return;
            await AppMethods.showMessageDialog(
                context: context, message: error.code, isError: true);
          } catch (error) {
            isLoading.isLoadingChange;
            log(error.toString());
            if (!context.mounted) return;
            await AppMethods.showMessageDialog(
              context: context,
              message: error.toString(),
              isError: true,
            );
          }
        }
      }
    }
  }

  static Future<void> forgetPasswordMethod({
    required IsLoadingProvider isLoading,
    required BuildContext context,
    required String email,
    required GlobalKey<FormState> formKey,
  }) async {
    {
      if (formKey.currentState!.validate()) {
        isLoading.isLoadingChange;
        try {
          await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
          log('done');
          isLoading.isLoadingChange;
          if (!context.mounted) return;
          Navigator.pushReplacementNamed(context, LogInPage.routName);
        } on FirebaseException catch (error) {
          isLoading.isLoadingChange;
          await AppMethods.showMessageDialog(
              context: context, message: error.message!, isError: true);
        } catch (error) {
          isLoading.isLoadingChange;
          log(error.toString());
          await AppMethods.showMessageDialog(
              context: context, message: error.toString(), isError: true);
        }
      }
    }
  }
}
