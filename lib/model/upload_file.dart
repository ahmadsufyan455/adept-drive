import 'package:get/get.dart';

class UploadFile {
  bool? data;
  String? message;

  UploadFile(this.data, this.message);

  UploadFile.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    message = json['message'];
  }
}

class UploadFileBody {
  FormData? formData;
  String? folderID;

  UploadFileBody(this.formData, this.folderID);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = formData;
    data['folderID'] = folderID;
    return data;
  }
}
