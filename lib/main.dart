import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style/core/Consts/color_consts.dart';
import 'package:style/core/Widgets/Main_Layout.dart';

import 'package:style/core/utils/Api/api_service.dart';
import 'package:style/core/utils/Api/dio_client.dart';

import 'package:style/features/Auth/data/Repo/Auth_Repo_Imp.dart';
import 'package:style/features/Auth/presentation/manager/Login_Cubit/login_cubit.dart';
import 'package:style/features/Auth/presentation/manager/Register_Cubit/register_cubit.dart';


import 'package:style/features/Cart/Data/Cart_Repo_Imp.dart';
import 'package:style/features/Cart/presentation/manager/Add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:style/features/Cart/presentation/manager/Fetch_cart_items.dart/fetch_cart_items_cubit.dart';

import 'package:style/features/Home/data/Repo/Home_Repo_Imp.dart';
import 'package:style/features/Home/presentation/manager/fetch_Sub_Category_cubit/fetch_subcategory_cubit.dart';
import 'package:style/features/Home/presentation/manager/fetch_product_cubit/fetch_product_model_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioClient.setupInterceptors();

  runApp(StyleLoom());
}

class StyleLoom extends StatelessWidget {
  StyleLoom({super.key});
  final api = Api();
  late final authRepo = AuthRepoImp(api: api);
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
              create: (context) => RegisterCubit(AuthRepoImp(api: Api())),
            ),
            BlocProvider(create: (context) => LoginCubit(authRepo)),
            BlocProvider(
              create: (context) =>
                  FetchSubcategoryCubit(HomeRepoImp(api: Api()))
                    ..fetchSubCategory(mainId: 0),
            ),
            BlocProvider(
              create: (context) =>
                  FetchProductModelCubit(HomeRepoImp(api: Api()))
                    ..fetchproductmodel(mainId: 0),
            ),
            // BlocProvider(
            //   create: (context) =>
            //       FetchFavoraiteItemsCubit(FavoraiteRepoImp(api: Api())),
            // ),

            BlocProvider(
              create: (context) =>
                  AddToCartCubit(cartRepoImp: CartRepoImp(api: Api())),
            ),
            BlocProvider(create: (context) =>
                FetchCartItemsCubit(cartRepoImp: CartRepoImp(api: Api()))),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: "Roboto",
              scaffoldBackgroundColor: Consts.black12,
            ),
            home: child,
          ),
        );
      },
      child: MainLayout(), // ✅ صفحة البداية
    );
  }
}
