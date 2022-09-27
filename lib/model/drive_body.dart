class DriveBody {
  String? draw;
  List<Columns>? columns;
  List<Order>? order;
  String? start;
  String? length;
  Search? search;

  DriveBody(
      {this.draw,
      this.columns,
      this.order,
      this.start,
      this.length,
      this.search});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['draw'] = draw;
    if (columns != null) {
      data['columns'] = columns!.map((v) => v.toJson()).toList();
    }
    if (order != null) {
      data['order'] = order!.map((v) => v.toJson()).toList();
    }
    data['start'] = start;
    data['length'] = length;
    if (search != null) {
      data['search'] = search!.toJson();
    }
    return data;
  }
}

class Columns {
  String? data;

  Columns({this.data});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data;
    return data;
  }
}

class Order {
  String? column;
  String? dir;

  Order({this.column, this.dir});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['column'] = column;
    data['dir'] = dir;
    return data;
  }
}

class Search {
  String? value;
  String? regex;

  Search({this.value, this.regex});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['regex'] = regex;
    return data;
  }
}

class FileBody {
  String? folderID;

  FileBody({this.folderID});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['folderID'] = folderID;
    return data;
  }
}
