class DriveFolder {
  List<Data>? data;
  String? message;

  DriveFolder({this.data, this.message});

  DriveFolder.fromJson(Map<String, dynamic> json) {
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
  Id? parentId;
  String? name;
  int? type;
  String? order;
  List<Children>? children;
  List<String>? access;

  Data(
      {this.iId,
      this.parentId,
      this.name,
      this.type,
      this.order,
      this.children,
      this.access});

  Data.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? Id.fromJson(json['_id']) : null;
    parentId =
        json['parent_id'] != null ? Id.fromJson(json['parent_id']) : null;
    name = json['name'];
    type = json['type'];
    order = json['order'];
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(Children.fromJson(v));
      });
    }
    access = json['access'].cast<String>();
  }
}

class Id {
  String? oid;

  Id({this.oid});

  Id.fromJson(Map<String, dynamic> json) {
    oid = json['\$oid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['\$oid'] = oid;
    return data;
  }
}

class Children {
  Id? iId;
  String? name;
  int? type;
  Id? companyID;
  String? order;
  bool? active;
  Id? creatorID;
  Id? parentId;
  int? level;
  List<Children>? children;

  Children(
      {this.iId,
      this.name,
      this.type,
      this.companyID,
      this.order,
      this.active,
      this.creatorID,
      this.parentId,
      this.level,
      this.children});

  Children.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? Id.fromJson(json['_id']) : null;
    name = json['name'];
    type = json['type'];
    companyID =
        json['companyID'] != null ? Id.fromJson(json['companyID']) : null;
    order = json['order'];
    active = json['active'];
    creatorID =
        json['creatorID'] != null ? Id.fromJson(json['creatorID']) : null;
    parentId =
        json['parent_id'] != null ? Id.fromJson(json['parent_id']) : null;
    level = json['level'];
    if (json['children'] != null) {
      children = [];
      json['children'].forEach((v) {
        children!.add(Children.fromJson(v));
      });
    }
  }
}
