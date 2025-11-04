import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style/core/Consts/color_consts.dart';
import 'package:style/features/Auth/presentation/manager/Register_Cubit/register_cubit.dart';
import 'package:style/features/Auth/presentation/view/Log_in_screen/Login_View.dart';
import 'package:style/features/Auth/presentation/view/widgets/custom_elevated_button.dart';
import 'package:style/features/Auth/presentation/view/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  String? firstname;
  String? lastname;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Consts.black12,
      body: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 550.h,
                  width: 350.w,
                  padding: const EdgeInsets.all(32),
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
                        style: TextStyle(
                          color: Consts.brown99,
                          fontSize: 20.sp,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        "Welcome — create your new account",
                        style: TextStyle(
                          color: Consts.brown60,
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      CustomTextField(
                        onChanged: (value) => firstname = value,
                        labelText: 'First Name',
                        hintText: 'Enter your first name',
                      ),
                      SizedBox(height: 15.h),
                      CustomTextField(
                        onChanged: (value) => lastname = value,
                        labelText: "Last Name",
                        hintText: "Enter your last name",
                      ),
                      SizedBox(height: 15.h),
                      CustomTextField(
                        onChanged: (value) => email = value,
                        labelText: 'Email',
                        hintText: 'Enter your email',
                      ),
                      SizedBox(height: 15.h),
                      CustomTextField(
                        onChanged: (value) => password = value,
                        labelText: "Password",
                        hintText: "Create your password",
                        isPassword: true,
                      ),
                      SizedBox(height: 15.h),
                      CustomElevatedButton(
                        text: "Register",
                        onPressed: () {
                          BlocProvider.of<RegisterCubit>(context).register(
                            email: email ?? '',
                            password: password ?? '',
                            firstname: firstname ?? '',
                            lastname: lastname ?? '',
                          );
                        },
                      ),
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
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginView(),
                                ),
                              );
                            },
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
          );
        },
      ),
    );
  }
}
