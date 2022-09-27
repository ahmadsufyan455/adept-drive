class DriveFile {
  List<Data>? data;
  String? message;

  DriveFile({this.data, this.message});

  DriveFile.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class Data {
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
  Id? folderID;
  List<String>? access;

  Data(
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
      this.folderID,
      this.access});

  Data.fromJson(Map<String, dynamic> json) {
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
    folderID = json['folderID'] != null ? Id.fromJson(json['folderID']) : null;
    access = json['access'].cast<String>();
  }
}

class Id {
  String? oid;

  Id({this.oid});

  Id.fromJson(Map<String, dynamic> json) {
    oid = json['\$oid'];
  }
}

class CreatedAt {
  Date? date;

  CreatedAt({this.date});

  CreatedAt.fromJson(Map<String, dynamic> json) {
    date = json['\$date'] != null ? Date.fromJson(json['\$date']) : null;
  }
}

class Date {
  String? numberLong;

  Date({this.numberLong});

  Date.fromJson(Map<String, dynamic> json) {
    numberLong = json['\$numberLong'];
  }
}
