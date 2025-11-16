import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style/core/Consts/color_consts.dart';
import 'package:style/core/utils/Api/api.dart';

import 'package:style/features/Auth/data/Repo/Auth_Repo_Imp.dart';
import 'package:style/features/Auth/presentation/manager/Login_Cubit/login_cubit.dart';
import 'package:style/features/Auth/presentation/manager/Register_Cubit/register_cubit.dart';
import 'package:style/features/Auth/presentation/view/Log_in_screen/Login_View.dart';


import 'package:style/features/Home/data/Repo/Home_Repo_Imp.dart';
import 'package:style/features/Home/presentation/manager/fetch_Sub_Category_cubit/fetch_subcategory_cubit.dart';
import 'package:style/features/Home/presentation/manager/fetch_product_cubit/fetch_product_model_cubit.dart';

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
            BlocProvider(
              create: (context) =>
                  LoginCubit(AuthRepoImp(api: Api(dio: Dio()))),
            ),
            BlocProvider(
              create: (context) =>
                  FetchSubcategoryCubit(HomeRepoImp(api: Api(dio: Dio())))
                    ..fetchSubCategory(mainId: 0),
            ),
            BlocProvider(
              create: (context) =>
                  FetchProductModelCubit(HomeRepoImp(api: Api(dio: Dio())))
                    ..fetchproductmodel(mainId: 0),
            ),
          //  BlocProvider(create: (context) => FetchFavoraiteItemsCubit(FavoraiteRepoImp())),
          ],
          child: MaterialApp(
            
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: "Roboto",scaffoldBackgroundColor: Consts.black12),
            home: child,
          ),
        );
      },
      child: LoginView(), // ✅ صفحة البداية
    );
  }
}
