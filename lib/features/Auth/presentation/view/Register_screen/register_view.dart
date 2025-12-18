import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style/core/Consts/color_consts.dart';
import 'package:style/core/utils/validators/validators.dart';
import 'package:style/features/Auth/presentation/manager/Register_Cubit/register_cubit.dart';
import 'package:style/features/Auth/presentation/view/Log_in_screen/Login_View.dart';
import 'package:style/features/Auth/presentation/view/widgets/custom_elevated_button.dart';
import 'package:style/features/Auth/presentation/view/widgets/custom_text_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _handleRegister() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<RegisterCubit>(context).register(
        email: emailController.text.trim(),
        password: passwordController.text,
        firstname: firstNameController.text.trim(),
        lastname: lastNameController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Consts.black12,
      body: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 30.h),
                    Center(
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 400.w,
                          minHeight: 550.h,
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
                                "Create Account",
                                style: TextStyle(
                                  color: Consts.brown99,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                "Welcome — create your new account",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Consts.brown60,
                                  fontSize: 14.sp,
                                ),
                              ),
                              SizedBox(height: 24.h),
                              CustomTextField(
                                controller: firstNameController,
                                labelText: 'First Name',
                                hintText: 'Enter your first name',
                                validator: Validator.validateFirstName,
                              ),
                              SizedBox(height: 16.h),
                              CustomTextField(
                                controller: lastNameController,
                                labelText: "Last Name",
                                hintText: "Enter your last name",
                                validator: Validator.validateLastName,
                              ),
                              SizedBox(height: 16.h),
                              CustomTextField(
                                controller: emailController,
                                labelText: 'Email',
                                hintText: 'Enter your email',
                                validator: Validator.validateEmail,
                              ),
                              SizedBox(height: 16.h),
                              CustomTextField(
                                controller: passwordController,
                                labelText: "Password",
                                hintText: "Create your password",
                                isPassword: true,
                                validator: Validator.validatePassword,
                              ),
                              SizedBox(height: 24.h),
                              CustomElevatedButton(
                                text: "Register",
                                onPressed: _handleRegister,
                              ),
                              SizedBox(height: 16.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      "Already have an account?",
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
                                              const LoginView(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Sign in",
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
