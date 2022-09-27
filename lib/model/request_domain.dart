class RequestDomain {
  Data? data;
  String? message;

  RequestDomain({this.data, this.message});

  RequestDomain.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
}

class Data {
  String? username;
  List<String>? subdomain;

  Data({this.username, this.subdomain});

  Data.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    subdomain = json['subdomain'].cast<String>();
  }
}

class RequestDomainBody {
  String? username;
  String? password;

  RequestDomainBody({this.username, this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}
