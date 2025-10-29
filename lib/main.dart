import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style/core/utils/Api/api.dart';

import 'package:style/features/Auth/data/Repo/Auth_Repo_Imp.dart';
import 'package:style/features/Auth/presentation/manager/Register_Cubit/register_cubit.dart';

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
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  RegisterCubit(AuthRepoImp(api: Api(dio: Dio()))),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: "Roboto"),
            home: child,
          ),
        );
      },
      child: RegisterView(), // ✅ صفحة البداية
    );
  }
}
