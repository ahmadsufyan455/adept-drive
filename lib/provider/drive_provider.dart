import 'package:adept_drive/model/drive_file.dart';
import 'package:adept_drive/model/drive_folder.dart';
import 'package:adept_drive/model/drive_response.dart';
import 'package:adept_drive/model/request_domain.dart';
import 'package:adept_drive/model/request_token.dart';
import 'package:adept_drive/utils/constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DriveProvider extends GetConnect {
  Future<RequestDomain> requestDomain(Map data) async {
    final response = await post('$baseStaging/subdomain', data);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return RequestDomain.fromJson(response.body);
    }
  }

  Future<RequestToken> requestToken(Map data) async {
    final response = await put('$baseStaging/token', data);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return RequestToken.fromJson(response.body);
    }
  }

  Future<DriveResponse> postDrive(Map data) async {
    // temp token, should be generate from login user
    const Map<String, String> mapHeaders = {
      "Authorization":
          "Bearer eyJ1c2VySUQiOiI1OTYzMzVhODk0Y2JjMjA0MTAzM2FiMTUiLCJjb21wYW55SUQiOiI1OTYzMzVhODk0Y2JjMjA0MTAzM2FiMTIiLCJleHAiOjE2OTQ2NDk2MDAsImlhdCI6MTY2MzEzMDE4MX0.xPjXTyp0ltyIBjdJhZ0SRrlZ5a_LEFS1a3XEClQvyOo"
    };
    final response = await post(
      '$baseURL/api/asset/main/load/all',
      data,
      headers: mapHeaders,
    );
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return DriveResponse.fromJson(response.body);
    }
  }

  Future<DriveFolder> getFolder() async {
    final userPrefs = await SharedPreferences.getInstance();
    Map<String, String> mapHeaders = {
      "Authorization": "Bearer ${userPrefs.getString('token')}"
    };

    final response =
        await get('$baseStaging/asset/main/myfolder', headers: mapHeaders);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return DriveFolder.fromJson(response.body);
    }
  }

  Future<DriveFile> getFiles(Map data) async {
    final userPrefs = await SharedPreferences.getInstance();
    Map<String, String> mapHeaders = {
      "Authorization": "Bearer ${userPrefs.getString('token')}"
    };

    final response = await post('$baseStaging/asset/main/filesbyfolder', data,
        headers: mapHeaders);

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return DriveFile.fromJson(response.body);
    }
  }
}
