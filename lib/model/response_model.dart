
class ResponseModel {
  int statusCode = -1;
  String statusDescription = "";
  dynamic data ="";

  ResponseModel();
  ResponseModel.named({required this.statusCode, required this.statusDescription, this.data});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    statusCode = json["status_code"]??-1;
    statusDescription = json["status_description"]??"";
    data = json["data"]??"";
  }

  @override
  String toString() {
    return 'ResponseModel{statusCode: $statusCode, statusDescription: $statusDescription, data: $data}';
  }
}
