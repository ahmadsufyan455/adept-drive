class WorkflowDetail {
  Data? data;
  String? message;

  WorkflowDetail({this.data, this.message});

  WorkflowDetail.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
}

class Data {
  Id? iId;
  Id? companyID;
  String? title;
  String? description;
  List<Steps>? steps;
  bool? active;

  Data({
    this.iId,
    this.companyID,
    this.title,
    this.description,
    this.steps,
    this.active,
  });

  Data.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? Id.fromJson(json['_id']) : null;
    companyID =
        json['companyID'] != null ? Id.fromJson(json['companyID']) : null;
    title = json['title'];
    description = json['description'];
    if (json['steps'] != null) {
      steps = <Steps>[];
      json['steps'].forEach((v) {
        steps!.add(Steps.fromJson(v));
      });
    }
    active = json['active'];
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
  String? title;
  String? step;
  List<Process>? process;
  List<Forms>? forms;
  bool? readjustment;
  bool? approval;

  Steps({
    this.title,
    this.step,
    this.process,
    this.forms,
    this.readjustment,
    this.approval,
  });

  Steps.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    step = json['step'];
    if (json['process'] != null) {
      process = <Process>[];
      json['process'].forEach((v) {
        process!.add(Process.fromJson(v));
      });
    }
    if (json['forms'] != null) {
      forms = <Forms>[];
      json['forms'].forEach((v) {
        forms!.add(Forms.fromJson(v));
      });
    }
    readjustment = json['readjustment'];
    approval = json['approval'];
  }
}

class Process {
  List<Forms>? forms;
  List<Users>? users;
  String? next;
  Condition? condition;
  Id? formID;

  Process({
    this.forms,
    this.users,
    this.next,
    this.condition,
    this.formID,
  });

  Process.fromJson(Map<String, dynamic> json) {
    if (json['forms'] != null) {
      forms = <Forms>[];
      json['forms'].forEach((v) {
        forms!.add(Forms.fromJson(v));
      });
    }
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(Users.fromJson(v));
      });
    }
    next = json['next'];
    condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
    formID = json['formID'] != null ? Id.fromJson(json['formID']) : null;
  }
}

class Forms {
  String? oid;

  Forms({this.oid});

  Forms.fromJson(Map<String, dynamic> json) {
    oid = json['\$oid'];
  }
}

class Users {
  String? oid;

  Users({this.oid});

  Users.fromJson(Map<String, dynamic> json) {
    oid = json['\$oid'];
  }
}

class Condition {
  bool? valid;

  Condition({this.valid});

  Condition.fromJson(Map<String, dynamic> json) {
    valid = json['valid'];
  }
}
