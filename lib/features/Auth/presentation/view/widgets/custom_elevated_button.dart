import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style/core/Consts/color_consts.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            vertical: 14.h,
            horizontal: 16.w,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.black26,
          elevation: 3,
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Consts.brown60,
                Consts.brown65,
                Consts.brown70,
                Consts.brown80,
                Consts.brown90,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Container(
            alignment: Alignment.center,
            constraints: BoxConstraints(
              minHeight: 48.h,
            ),
            padding: EdgeInsets.symmetric(vertical: 4.h),
            child: Text(
              text,
              style: TextStyle(
                color: Consts.black06,
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
