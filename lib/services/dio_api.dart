// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
// import 'package:flutter/services.dart';
// import 'package:passport_photo_2/helpers/log_custom.dart';
// import 'package:path_provider/path_provider.dart';

// class Api {
//   final baseUrl = "https://tapuniverse.com/bgremover/jwt-request";
//   final secretKey =
//       "9476bcdb5e9d72c7f96a02aeb29a6b43d4409d6738209e62fa73be41630e6903";
 
//   Future<File?> postBackgroundRemove(String filePath, {String? outputName ="temp"}) async {
//     try {
//       final outputPath = "${(await getExternalStorageDirectory())!.path}/$outputName.png";
//       Dio dio = Dio();
//       final jwt = JWT(
//         {
//           "iat": DateTime.now().microsecondsSinceEpoch,
//         },
//       );
//       final jwtToken = jwt.sign(
//         SecretKey(secretKey),
//       );
//       var headers = {
//         'Authorization': 'Bearer $jwtToken',
//         "Content-Type": "image/png",
//       };
//       var data = FormData.fromMap({
//         'files': [
//           await MultipartFile.fromFile(filePath,
//               filename: filePath.split("/").last)
//         ],
//       });
//       var response = await dio.request<Uint8List>(
//         baseUrl,
//         data: data,
//         options: Options(
//           method: 'POST',
//           headers: headers,
//           responseType: ResponseType.bytes,
//         ),
//       );

//       if (response.statusCode == 200) {
//         Uint8List? bytes = response.data; 
//         return (await File(outputPath).writeAsBytes(bytes!));
//       } else {
//         consolelog("response.statusMessage: ${response.statusMessage}");
//       }
//     } catch (e) {
//       consolelog("postBgRemove error:${e.toString()}");
//     }
//     return null;
//   }

//   Future getRequestBaseWithToken(
//       String path, Map<String, dynamic>? params) async {
//     try {
//       Dio dio = Dio();
//       var response = await dio.get(path, queryParameters: params);
//       if (response.statusCode == 200) {
//         return response.data;
//       }
//       if (response.statusCode == 400) {
//         return {"status": response.statusCode, "content": response.data};
//       }
//       if (response.statusCode == 422) {
//         return response.data;
//       }
//       if (response.statusCode == 500) {
//         String message = "Server đang có vấn đề. Hãy thử lại sau";
//         return {"status": response.statusCode, "content": message};
//       }
//     } on DioError catch (e) {
//       consolelog("get api error: ${e.toString()}");
//       return null;
//     }
//   }

//   Future postRequestBase(String path, data) async {
//     try {
//       Dio dio = Dio();
//       var response = await dio.post(path, data: data);
//       return response.data;
//     } on DioError catch (e) {
//       return {
//         "status_code": e.response?.statusCode,
//         "content": e.response?.data
//       };
//     }
//   }
// }
