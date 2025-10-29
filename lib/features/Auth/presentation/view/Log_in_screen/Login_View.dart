import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style/core/Consts/color_consts.dart';
import 'package:style/features/Auth/presentation/view/widgets/custom_elevated_button.dart';
import 'package:style/features/Auth/presentation/view/widgets/custom_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Consts.black12,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 400.h,
              width: 350.w,
              padding: EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Consts.black10,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Consts.brown60,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Consts.black10,
                    radius: 20,
                    child: Image.asset("asset/images/Vector (2).png"),
                  ),
                  Text(
                    "Sign In",
                    style: TextStyle(color: Consts.brown99, fontSize: 20.sp),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "Welcome back __ please log in to your account",
                    style: TextStyle(color: Consts.brown60, fontSize: 12.sp),
                  ),
                  SizedBox(height: 10.h),
                  CustomTextField(
                    labelText: 'Email',
                    hintText: 'example@domain.com',
                  ),
                  SizedBox(height: 15.h),
                  CustomTextField(
                    labelText: "Password",
                    hintText: "Enter your password",
                    isPassword: true,
                  ),
                  SizedBox(height: 15.h),
                  CustomElevatedButton(text: "Sign In", onPressed: () {}),
                  SizedBox(height: 15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Consts.brown80,
                          fontSize: 15.sp,
                        ),
                      ),

                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Register now",
                          style: TextStyle(
                            color: Consts.brown60,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15.h),
          Text(
            "By signing in, you agree to our terms and Privacy Policy",
            style: TextStyle(color: Consts.brown70, fontSize: 12.h),
          ),
        ],
      ),
    );
  }
}
