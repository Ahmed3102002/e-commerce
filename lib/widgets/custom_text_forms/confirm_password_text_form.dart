import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/show_password_provider.dart';
import 'package:store/utils/methods/validator_methods.dart';
import 'package:store/widgets/custom_text_forms/custom_text_form.dart';

class ConfirmPasswordTextForm extends StatelessWidget {
  const ConfirmPasswordTextForm({
    super.key,
    required TextEditingController passwordController,
    required FocusNode confirmPasswordFocusNode,
    required TextEditingController confirmPasswordController,
  })  : _passwordController = passwordController,
        _confirmPasswordFocusNode = confirmPasswordFocusNode,
        _confirmPasswordController = confirmPasswordController;

  final TextEditingController _passwordController;
  final FocusNode _confirmPasswordFocusNode;
  final TextEditingController _confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    final ShowPasswordProvider isVisiable =
        Provider.of<ShowPasswordProvider>(context);
    return CustomTextForm(
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus;
      },
      validator: (value) {
        return ValidatorMethods.confirmPasswordValidator(
            value, _passwordController.text.trim());
      },
      keyboardType: TextInputType.visiblePassword,
      focusNode: _confirmPasswordFocusNode,
      obscureText: isVisiable.getShowPassword,
      hintText: 'Enter your password again',
      controller: _confirmPasswordController,
      prefixIcon: Icon(
        IconlyBroken.password,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      suffixIcon: IconButton(
        onPressed: () async {
          isVisiable.showPassword;
        },
        icon: Icon(
            isVisiable.getShowPassword ? IconlyBroken.hide : IconlyBroken.show,
            color: Theme.of(context).scaffoldBackgroundColor),
      ),
    );
  }
}
