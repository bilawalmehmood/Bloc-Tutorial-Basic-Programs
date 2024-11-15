abstract class HTTPRequest {
  Future<dynamic> getRequest({required String url, Map<String, String> params =const{}, bool requireToken = true});

  Future<dynamic> postRequest({required String url, dynamic requestBody, bool requireToken = true,bool isJsonData =false});

  // Future<dynamic> putRequest(String url, dynamic body);

  // Future<dynamic> deleteRequest(String url);

  // Future<dynamic> multiPartRequest(String url, dynamic body);

  
}