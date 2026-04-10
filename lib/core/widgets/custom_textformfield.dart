import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.validate,
    this.prefixIcon,
    this.hintText,
    this.onChange,
    this.onSubmit,
    this.obsecureText,
    this.circularRadius,
    this.verticalPadding,
    this.horizontalPadding,
    this.maxLines,
    this.textInputType,
    this.cursorHeight,
    this.cursorWidth,
    this.suffixIcon,
    this.hintTextStyle,
    this.readOnly,
    this.onTap,
  });

  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obsecureText;
  final Function(String)? onChange;
  final Function(String)? onSubmit;
  final FormFieldValidator? validate;
  final TextEditingController? controller;
  final double? circularRadius;
  final double? verticalPadding;
  final double? horizontalPadding;
  final int? maxLines;
  final TextInputType? textInputType;
  final double? cursorHeight;
  final double? cursorWidth;
  final TextStyle? hintTextStyle;
  final bool? readOnly;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly: readOnly ?? false,
      maxLines: maxLines ?? 1,
      controller: controller,
      obscureText: obsecureText ?? false,
      validator: validate,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? 15,
          horizontal: horizontalPadding ?? 12,
        ),
        hintText: hintText,
        hintStyle:
            hintTextStyle ??
            const TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: const Color(0xffE8EBF0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(circularRadius ?? 8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(circularRadius ?? 8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(circularRadius ?? 8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(circularRadius ?? 8),
        ),
      ),
      keyboardType: textInputType ?? TextInputType.text,
      cursorHeight: cursorHeight ?? 21,
      cursorWidth: cursorWidth ?? 2,
    );
  }
}
