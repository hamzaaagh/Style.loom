import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  final void Function(String)? onChanged;

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
      onChanged: widget.onChanged,
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscure : false,
      style: TextStyle(
        color: widget.textColor,
        fontSize: 16.sp,
      ),
      cursorColor: widget.cursorColor,
      validator: widget.validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: Consts.black12,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: widget.labelColor,
          fontSize: 14.sp,
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: widget.hintColor,
          fontSize: 14.sp,
        ),
        errorStyle: TextStyle(
          color: Colors.red,
          fontSize: 11.sp,
        ),
        errorMaxLines: 2,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscure
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: widget.focusBorderColor,
                  size: 20.sp,
                ),
                onPressed: () {
                  setState(() {
                    _obscure = !_obscure;
                  });
                },
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: widget.borderColor,
            width: 1.2.w,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: widget.focusBorderColor,
            width: 1.5.w,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.2.w,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.5.w,
          ),
        ),
      ),
    );
  }
}
