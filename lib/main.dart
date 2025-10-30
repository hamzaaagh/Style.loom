import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style/features/Auth/presentation/view/Log_in_screen/Login_View.dart';
import 'package:style/features/Auth/presentation/view/Register_screen/register_view.dart';

void main() {
  runApp(const StyleLoom());
}

class StyleLoom extends StatelessWidget {
  const StyleLoom({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844), 
      minTextAdapt: true,               
      splitScreenMode: true,            
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: "Roboto"),
          home: child,
        );
      },
      child: const LoginView(),
    );
  }
}
