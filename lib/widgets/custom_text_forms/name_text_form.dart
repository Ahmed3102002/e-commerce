import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store/utils/methods/validator_methods.dart';
import 'package:store/widgets/custom_text_forms/custom_text_form.dart';

class NameTextForm extends StatelessWidget {
  const NameTextForm({
    super.key,
    required FocusNode mailFocusNode,
    required FocusNode nameFocusNode,
    required TextEditingController nameController,
  })  : _mailFocusNode = mailFocusNode,
        _nameFocusNode = nameFocusNode,
        _nameController = nameController;

  final FocusNode _mailFocusNode;
  final FocusNode _nameFocusNode;
  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return CustomTextForm(
      validator: ValidatorMethods.nameValidator,
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(_mailFocusNode);
      },
      keyboardType: TextInputType.text,
      focusNode: _nameFocusNode,
      hintText: 'Enter your name',
      controller: _nameController,
      prefixIcon: Icon(IconlyBroken.user2,
          color: Theme.of(context).scaffoldBackgroundColor),
    );
  }
}
