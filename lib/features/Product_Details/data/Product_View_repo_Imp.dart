// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:style/core/Models/product_model/product_model.dart';
// import 'package:style/core/utils/Api/api.dart';
// import 'package:style/core/utils/errors/failurs.dart';
// import 'package:style/features/Product_Details/data/Product_View_repo.dart';

// class ProductViewRepoImp implements ProductViewRepo {
//   final Api api;

//   ProductViewRepoImp({required this.api});
//   @override
//   Future<Either<Failurs, List<ProductModel>>> fetchsimiliarproducts({
//     required int id,
//   }) async {
//     var response = await api.get(endpoint: "product/$id");
//     try {
//       if (response.statusCode == 200) {
//         final List<ProductModel> products = [];
//         for (var item in response.data) {
//           products.add(ProductModel.fromJson(item));
//           return right(products);
//         }
//       } else {
//         return left(
//           Serverfailur(
//             errormessage:
//                 'Failed to fetch products with status code: ${response.statusCode}',
//           ),
//         );
//       }
//     } catch (e) {
//       if (e is DioException) {
//         return left(Serverfailur.fromDioexaption(e));
//       }
      
//     }
//     return left(Serverfailur(errormessage: "Something went wrong"));
//   }
// }
