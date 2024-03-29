import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    required this.hintText,
    required this.controller,
    this.labelText = '',
    this.onChanged,
    this.suffixIcon,
    this.obscureText = false,
    this.onFieldSubmitted,
    this.validator,
    this.prefixIcon,
    this.focusNode,
    this.keyboardType,
  });

  final String labelText;
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: TextFormField(
        keyboardType: keyboardType,
        focusNode: focusNode,
        autofocus: false,
        onFieldSubmitted: onFieldSubmitted,
        obscureText: obscureText,
        onChanged: onChanged,
        controller: controller,
        validator: validator,
        style: GoogleFonts.abhayaLibre(
          fontSize: 15,
          color: Theme.of(context).dividerColor,
        ),
        decoration: InputDecoration(
          filled: true,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintMaxLines: 1,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
          hintStyle: GoogleFonts.abhayaLibre(
            fontSize: 18,
            color: Theme.of(context).dividerColor,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Theme.of(context).dividerColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Theme.of(context).dividerColor),
          ),
        ),
      ),
    );
  }
}
