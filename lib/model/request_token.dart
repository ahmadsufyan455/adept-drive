class RequestToken {
  Data? data;
  String? message;

  RequestToken({this.data, this.message});

  RequestToken.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
}

class Data {
  String? token;
  String? username;
  int? exp;
  int? iat;
  Role? role;
  bool? enableSkip;
  String? id;
  bool? enableSOS;

  Data({
    this.token,
    this.username,
    this.exp,
    this.iat,
    this.role,
    this.enableSkip,
    this.id,
    this.enableSOS,
  });

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    username = json['username'];
    exp = json['exp'];
    iat = json['iat'];
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
    enableSkip = json['enableSkip'];
    id = json['id'];
    enableSOS = json['enableSOS'];
  }
}

class Role {
  Id? iId;
  String? name;

  Role({this.iId, this.name});

  Role.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? Id.fromJson(json['_id']) : null;
    name = json['name'];
  }
}

class Id {
  String? oid;

  Id({this.oid});

  Id.fromJson(Map<String, dynamic> json) {
    oid = json['\$oid'];
  }
}

class RequestTokenBody {
  String? username;
  String? password;
  String? subdomain;

  RequestTokenBody({this.username, this.password, this.subdomain});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data['subdomain'] = subdomain;
    return data;
  }
}
