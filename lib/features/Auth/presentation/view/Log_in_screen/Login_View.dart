import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style/core/Consts/color_consts.dart';
import 'package:style/core/utils/validators/validators.dart';
import 'package:style/features/Auth/presentation/manager/Login_Cubit/login_cubit.dart';
import 'package:style/features/Auth/presentation/view/Register_screen/register_view.dart';
import 'package:style/features/Auth/presentation/view/widgets/custom_elevated_button.dart';
import 'package:style/features/Auth/presentation/view/widgets/custom_text_field.dart';
import 'package:style/features/Home/presentation/view/Home_View.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<LoginCubit>(context).login(
        email: emailController.text.trim(),
        password: passwordController.text,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeView(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Consts.black12,
      body: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 40.h),
                    Center(
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 400.w,
                          minHeight: 400.h,
                        ),
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 32.h,
                        ),
                        decoration: BoxDecoration(
                          color: Consts.black10,
                          borderRadius: BorderRadius.circular(18.r),
                          boxShadow: [
                            BoxShadow(
                              color: Consts.brown60.withOpacity(0.3),
                              blurRadius: 10.r,
                              spreadRadius: 2.r,
                            ),
                          ],
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                backgroundColor: Consts.black10,
                                radius: 30.r,
                                child: Image.asset(
                                  "asset/images/Vector (2).png",
                                  width: 30.w,
                                  height: 30.h,
                                ),
                              ),
                              SizedBox(height: 16.h),
                              Text(
                                "Sign In",
                                style: TextStyle(
                                  color: Consts.brown99,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                "Welcome back __ please log in to your account",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Consts.brown60,
                                  fontSize: 14.sp,
                                ),
                              ),
                              SizedBox(height: 24.h),
                              CustomTextField(
                                controller: emailController,
                                labelText: 'Email',
                                hintText: 'example@domain.com',
                                validator: Validator.validateEmail,
                              ),
                              SizedBox(height: 16.h),
                              CustomTextField(
                                controller: passwordController,
                                labelText: "Password",
                                hintText: "Enter your password",
                                isPassword: true,
                                validator: Validator.validatePassword,
                              ),
                              SizedBox(height: 24.h),
                              CustomElevatedButton(
                                text: "Sign In",
                                onPressed: _handleLogin,
                              ),
                              SizedBox(height: 16.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      "Don't have an account?",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Consts.brown80,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 4.w),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterView(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Register now",
                                      style: TextStyle(
                                        color: Consts.brown60,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        "By signing in, you agree to our terms and Privacy Policy",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Consts.brown70,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
