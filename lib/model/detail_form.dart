class DetailForm {
  Data? data;
  String? message;

  DetailForm({this.data, this.message});

  DetailForm.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
}

class Data {
  Id? iId;
  Id? companyID;
  Id? userID;
  String? title;
  String? description;
  String? inputBy;
  bool? active;
  List<DataFromDetail>? data;
  Report? report;
  CreatedAt? createdAt;
  CreatedAt? updatedAt;

  Data(
      {this.iId,
      this.companyID,
      this.userID,
      this.title,
      this.description,
      this.inputBy,
      this.active,
      this.data,
      this.report,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? Id.fromJson(json['_id']) : null;
    companyID =
        json['companyID'] != null ? Id.fromJson(json['companyID']) : null;
    userID = json['userID'] != null ? Id.fromJson(json['userID']) : null;
    title = json['title'];
    description = json['description'];
    inputBy = json['inputBy'];
    active = json['active'];
    if (json['data'] != null) {
      data = <DataFromDetail>[];
      json['data'].forEach((v) {
        data!.add(DataFromDetail.fromJson(v));
      });
    }
    report = json['report'] != null ? Report.fromJson(json['report']) : null;
    createdAt = json['createdAt'] != null
        ? CreatedAt.fromJson(json['createdAt'])
        : null;
    updatedAt = json['updatedAt'] != null
        ? CreatedAt.fromJson(json['updatedAt'])
        : null;
  }
}

class Id {
  String? oid;

  Id({this.oid});

  Id.fromJson(Map<String, dynamic> json) {
    oid = json['\$oid'];
  }
}

class DataFromDetail {
  String? type;
  String? label;
  String? className;
  String? name;
  String? inputBy;
  String? source;
  List<Values>? values;
  Dataset? dataset;
  String? subtype;

  DataFromDetail(
      {this.type,
      this.label,
      this.className,
      this.name,
      this.inputBy,
      this.source,
      this.values,
      this.dataset,
      this.subtype});

  DataFromDetail.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    label = json['label'];
    className = json['className'];
    name = json['name'];
    inputBy = json['inputBy'];
    source = json['source'];
    if (json['values'] != null) {
      values = <Values>[];
      json['values'].forEach((v) {
        values!.add(Values.fromJson(v));
      });
    }
    dataset =
        json['dataset'] != null ? Dataset.fromJson(json['dataset']) : null;
    subtype = json['subtype'];
  }
}

class Values {
  String? label;
  String? value;

  Values({this.label, this.value});

  Values.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    value = json['value'];
  }
}

class Dataset {
  String? type;
  String? url;

  Dataset({this.type, this.url});

  Dataset.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
  }
}

class Report {
  bool? submittedDate;
  bool? headerLogo;

  Report({this.submittedDate, this.headerLogo});

  Report.fromJson(Map<String, dynamic> json) {
    submittedDate = json['submitted_date'];
    headerLogo = json['header_logo'];
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
