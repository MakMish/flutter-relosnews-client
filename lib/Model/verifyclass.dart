class verclasss {
  String? detail;
  String? status;
  verclasss({this.detail,this.status});

  verclasss.fromJson(Map<String, dynamic> json) {
    detail = json['detail'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['detail'] = this.detail;
    data['status'] = this.status;
    return data;
  }
}