import 'package:flutter/material.dart';
import 'package:style/core/Consts/color_consts.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final Color textColor;
  final Color labelColor;
  final Color hintColor;
  final Color borderColor;
  final Color focusBorderColor;
  final Color cursorColor;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged; // ← تم دمجها من شغل رفيقك

  const CustomTextField({
    super.key,
    this.labelText,
    this.hintText,
    this.isPassword = false,
    this.controller,
    this.textColor = Consts.brown99,
    this.labelColor = Consts.brown60,
    this.hintColor = Consts.gray70,
    this.borderColor = Consts.black12,
    this.focusBorderColor = Consts.brown60,
    this.cursorColor = Consts.gray99,
    this.validator,
    this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged, // ✅ من شغل رفيقك
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscure : false,
      style: TextStyle(color: widget.textColor, fontSize: 16),
      cursorColor: widget.cursorColor,
      validator: widget.validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: Consts.black12,
        labelText: widget.labelText,
        labelStyle: TextStyle(color: widget.labelColor),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: widget.hintColor),
        errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscure
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: widget.focusBorderColor,
                ),
                onPressed: () {
                  setState(() {
                    _obscure = !_obscure;
                  });
                },
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: widget.borderColor, width: 1.2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: widget.focusBorderColor, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.red, width: 1.2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
      ),
    );
  }
}
