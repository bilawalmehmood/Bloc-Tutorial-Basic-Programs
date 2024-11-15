import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:bloc_prectice/config/errors/exception.dart';
import 'package:bloc_prectice/config/services/http_request.dart';
import 'package:bloc_prectice/model/response_model.dart';
import 'package:http/http.dart' as http;

class HTTPClient implements HTTPRequest {
  HTTPClient._internal();
  factory HTTPClient() {
    return _instance;
  }
  static const int _requestTimeOut = 50;
  static final HTTPClient _instance = HTTPClient._internal();


  @override
  Future<ResponseModel> getRequest({required String url, Map<String, String> params =const{}, bool requireToken = true}) async{
    try {
      if(params.isNotEmpty){
        log('───────────────────Get> $params');
        url ='$url?';
        for(MapEntry<String, String> p in params.entries){
          url = '$url${p.key}=${p.value}&';
        }
        url = url.substring(0,url.length-1);
      }
      http.Response response = await http.get(Uri.parse(url), headers: requireToken ?  await _getHeaders(): null).timeout(const Duration(seconds: _requestTimeOut));
      log('───────────────────Get> $url\n${response.body}');
      return _getResponseModel(response);
    } on TimeoutException {
      throw RequestTimeOutException();
    } on SocketException {
      throw NoInternetException();
    } on HttpException {
      throw NetworkException();
    } on FormatException {
      throw UnknownException();
    }
  }

  @override
  Future<dynamic> postRequest({required String url, dynamic requestBody, bool requireToken = true,bool isJsonData =false}) async{
    try {
      log('───────────────────Post> $url\n$requestBody');
      http.Response response = await http.post(Uri.parse(url), headers: requireToken ?  await _getHeaders(): null, body: isJsonData ? jsonEncode(requestBody): requestBody).timeout(const Duration(seconds: _requestTimeOut));
      log('───────────────────Post> $url\n${response.body}');
      return _getResponseModel(response);
    } on TimeoutException {
      throw RequestTimeOutException();
    } on SocketException {
      throw NoInternetException();
    } on HttpException {
      throw NetworkException();
    } on FormatException {
      throw UnknownException();
    }
  }

 ResponseModel _getResponseModel(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return ResponseModel.fromJson(response.body is Map ?response.body : jsonDecode(response.body));
      case 401:
        throw SessionExpireException();
      case 403:
        throw PermissionException();
      case 500:
        throw ServerException();
      default:
        throw UnknownException();
    }
  }

Future<Map<String, String>> _getHeaders() async {
  // TokenModel? token = await UserSession().getToken();
  // if(token.isExpired){
  //   if(ProgressDialog().isOpened){
  //     ProgressDialog().dismissDialog();
  //   }
  //   await UserSession().logout();
  //   CustomDialogs().showDialog('Alert', kSessionExpireMsg, DialogType.warning, onOkBtnPressed: (){
  //     Get.offAllNamed(kLoginScreenRoute);
  //   });
  //   return {};
  // }
  // else if(token.accessToken.isNotEmpty) {
  //   return {'Authorization': 'Bearer ${token.accessToken}'};
  // }
  // else{
  //   return {};
  // }
  return {};
}

}

