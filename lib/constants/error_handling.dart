// import 'dart:convert';


// import 'package:facturo/constants/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// void httpErrorHandle({
//   required http.Response response,
//   required BuildContext context,
//   required VoidCallback onSuccess,
//   required VoidCallback onFailed,
// }) {
//   switch (response.statusCode) {
//     case 200 || 201:
//       onSuccess();
//       break;
//     case 400:
//       onFailed();
//       showSnackBar(context, jsonDecode(response.body)['errorDescription']);
//       break;
//     case 403:
//       onFailed();
//       showSnackBar(context, jsonDecode(response.body)['error']);
//       break;
//     case 500:
//       onFailed();
//       showSnackBar(context, jsonDecode(response.body)['errorDescription']);

//       break;
//     default:
//       onFailed();
//       showSnackBar(context, jsonDecode(response.body));
//       break;
//   }
// }
