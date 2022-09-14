import 'package:adept_drive/model/drive_response.dart';
import 'package:adept_drive/utils/constants.dart';
import 'package:get/get.dart';

class DriveProvider extends GetConnect {
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
}
