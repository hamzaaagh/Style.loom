import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style/core/Consts/color_consts.dart';
import 'package:style/features/Auth/presentation/view/widgets/custom_elevated_button.dart';
import 'package:style/features/Auth/presentation/view/widgets/custom_text_field.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Consts.black12,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 550.h,
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
                    "Create Account",
                    style: TextStyle(color: Consts.brown99, fontSize: 20.sp),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "Welcome __ create your new account",
                    style: TextStyle(color: Consts.brown60, fontSize: 12.sp),
                  ),
                  SizedBox(height: 15.h),
                  CustomTextField(
                    labelText: 'First Name',
                    hintText: 'Enter your first name',
                  ),
                  SizedBox(height: 15.h),
                  CustomTextField(
                    labelText: "Last Name",
                    hintText: "Enter your last name",
                    isPassword: false,
                  ),
                  SizedBox(height: 15.h),
                  CustomTextField(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                  ),
                  // CustomElevatedButton(text: "Sign In", onPressed: () {}),
                  SizedBox(height: 15.h),
                  CustomTextField(
                    labelText: "Password",
                    hintText: "Create your password",
                    isPassword: true,
                  ),
                  SizedBox(height: 15.h),
                  CustomElevatedButton(text: "Register", onPressed: () {}),
                  SizedBox(height: 7.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: Consts.brown80,
                          fontSize: 15.sp,
                        ),
                      ),

                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Sign in",
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
