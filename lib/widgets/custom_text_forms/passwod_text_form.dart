import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/show_password_provider.dart';
import 'package:store/utils/methods/validator_methods.dart';
import 'package:store/widgets/custom_text_forms/custom_text_form.dart';

class PasswordTextForm extends StatelessWidget {
  const PasswordTextForm({
    super.key,
    FocusNode? confirmPasswordFocusNode,
    required FocusNode passwordFocusNode,
    required TextEditingController passwordController,
  })  : _confirmPasswordFocusNode = confirmPasswordFocusNode,
        _passwordFocusNode = passwordFocusNode,
        _passwordController = passwordController;
  final FocusNode? _confirmPasswordFocusNode;
  final FocusNode _passwordFocusNode;

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    final ShowPasswordProvider isVisiable =
        Provider.of<ShowPasswordProvider>(context);
    return CustomTextForm(
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(_confirmPasswordFocusNode);
      },
      validator: ValidatorMethods.passwordValidator,
      keyboardType: TextInputType.visiblePassword,
      focusNode: _passwordFocusNode,
      obscureText: isVisiable.getShowPassword,
      hintText: 'Enter your password',
      controller: _passwordController,
      prefixIcon: Icon(
        IconlyBroken.password,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      suffixIcon: IconButton(
        onPressed: () {
          isVisiable.showPassword;
        },
        icon: Icon(
            isVisiable.getShowPassword ? IconlyBroken.hide : IconlyBroken.show,
            color: Theme.of(context).scaffoldBackgroundColor),
      ),
    );
  }
}
