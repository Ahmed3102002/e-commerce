import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:store/providers/is_loading_provider.dart';
import 'package:store/utils/constant/const_values.dart';
import 'package:store/utils/methods/auth_methods.dart';

class CustomGoogleButton extends StatelessWidget {
  const CustomGoogleButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final IsLoadingProvider isLoading = Provider.of<IsLoadingProvider>(context);
    return SignInButton(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      elevation: 5,
      shape: const RoundedRectangleBorder(
          borderRadius: ConstValues.borderRadius, side: BorderSide.none),
      Buttons.google,
      onPressed: () => AuthMethods.logInWithGoogleMethod(
        isLoading: isLoading,
        context: context,
      ),
    );
  }
}
