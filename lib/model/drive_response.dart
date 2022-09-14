class DriveResponse {
  Data? data;
  String? message;

  DriveResponse({this.data, this.message});

  DriveResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
}

class Data {
  int? draw;
  int? recordsTotal;
  int? recordsFiltered;
  List<DriveData>? data;

  Data({this.draw, this.recordsTotal, this.recordsFiltered, this.data});

  Data.fromJson(Map<String, dynamic> json) {
    draw = json['draw'];
    recordsTotal = json['recordsTotal'];
    recordsFiltered = json['recordsFiltered'];
    if (json['data'] != null) {
      data = <DriveData>[];
      json['data'].forEach((v) {
        data!.add(DriveData.fromJson(v));
      });
    }
  }
}

class DriveData {
  Id? iId;
  String? name;
  String? description;
  String? fullpath;
  String? key;
  String? size;
  String? type;
  Id? companyID;
  Id? userID;
  bool? active;
  CreatedAt? createdAt;
  CreatedAt? updatedAt;
  String? downloadPath;

  DriveData(
      {this.iId,
      this.name,
      this.description,
      this.fullpath,
      this.key,
      this.size,
      this.type,
      this.companyID,
      this.userID,
      this.active,
      this.createdAt,
      this.updatedAt,
      this.downloadPath});

  DriveData.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? Id.fromJson(json['_id']) : null;
    name = json['name'];
    description = json['description'];
    fullpath = json['fullpath'];
    key = json['key'];
    size = json['size'];
    type = json['type'];
    companyID =
        json['companyID'] != null ? Id.fromJson(json['companyID']) : null;
    userID = json['userID'] != null ? Id.fromJson(json['userID']) : null;
    active = json['active'];
    createdAt = json['createdAt'] != null
        ? CreatedAt.fromJson(json['createdAt'])
        : null;
    updatedAt = json['updatedAt'] != null
        ? CreatedAt.fromJson(json['updatedAt'])
        : null;
    downloadPath = json['download_path'];
  }
}

class Id {
  String? oid;

  Id({this.oid});

  Id.fromJson(Map<String, dynamic> json) {
    oid = json['$oid'];
  }
}

class CreatedAt {
  Date? date;

  CreatedAt({this.date});

  CreatedAt.fromJson(Map<String, dynamic> json) {
    date = json['$date'] != null ? Date.fromJson(json['$date']) : null;
  }
}

class Date {
  String? numberLong;

  Date({this.numberLong});

  Date.fromJson(Map<String, dynamic> json) {
    numberLong = json['$numberLong'];
  }
}
