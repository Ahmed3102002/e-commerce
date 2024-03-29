import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store/utils/methods/validator_methods.dart';
import 'package:store/widgets/custom_text_forms/custom_text_form.dart';

class EmailTextForm extends StatelessWidget {
  const EmailTextForm({
    super.key,
    FocusNode? passwordFocusNode,
    required FocusNode mailFocusNode,
    required TextEditingController mailController,
  })  : _passwordFocusNode = passwordFocusNode,
        _mailFocusNode = mailFocusNode,
        _mailController = mailController;

  final FocusNode? _passwordFocusNode;
  final FocusNode _mailFocusNode;
  final TextEditingController _mailController;
  @override
  Widget build(BuildContext context) {
    return CustomTextForm(
      validator: ValidatorMethods.emailValidator,
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      },
      keyboardType: TextInputType.emailAddress,
      focusNode: _mailFocusNode,
      hintText: 'Enter your e_mail',
      controller: _mailController,
      prefixIcon: Icon(IconlyBroken.login,
          color: Theme.of(context).scaffoldBackgroundColor),
    );
  }
}
