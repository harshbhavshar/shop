// import 'dart:convert';
// import 'dart:io';
//
// import 'package:dio/dio.dart';
// import 'package:shop/config/apiconfig.dart';
//
// import '../Model/customermodel.dart';
//
// class API{
//   Future<bool> createCustomer(Customermodel model) async {
//     var authToken = base64.encode(utf8.encode(ApiConfig.key+":"+ApiConfig.secret));
//     bool ret = false;
//     try{
//       var respond = await Dio().post(
//         ApiConfig.url+ApiConfig.CustomerURL,
//         data: model.toJson(),
//         options: Options(
//           headers: {
//             HttpHeaders.authorizationHeader: 'Basic $authToken',
//             HttpHeaders.contentEncodingHeader: "application/json"
//           }
//         )
//       );
//       if(respond.statusCode == 200){
//         ret = true;
//       }
//     } on DioError catch(e){
//       if(e.response?.statusCode == 404){
//         ret = false;
//       }
//       else{
//         ret = false;
//       }
//     }
//     return ret;
//   }
// }