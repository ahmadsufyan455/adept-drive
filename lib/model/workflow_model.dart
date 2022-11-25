class Workflow {
  List<Data>? data;
  String? message;

  Workflow({this.data, this.message});

  Workflow.fromJson(Map<String, dynamic> json) {
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
  List<Steps>? steps;
  Id? companyID;
  String? title;
  String? description;

  Data({
    this.iId,
    this.steps,
    this.companyID,
    this.title,
    this.description,
  });

  Data.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? Id.fromJson(json['_id']) : null;
    if (json['steps'] != null) {
      steps = <Steps>[];
      json['steps'].forEach((v) {
        steps!.add(Steps.fromJson(v));
      });
    }
    companyID =
        json['companyID'] != null ? Id.fromJson(json['companyID']) : null;
    title = json['title'];
    description = json['description'];
  }
}

class Id {
  String? oid;

  Id({this.oid});

  Id.fromJson(Map<String, dynamic> json) {
    oid = json['\$oid'];
  }
}

class Steps {
  String? id;
  String? title;
  bool? readjustment;
  bool? approval;

  Steps({
    this.id,
    this.title,
    this.readjustment,
    this.approval,
  });

  Steps.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    readjustment = json['readjustment'];
    approval = json['approval'];
  }
}
