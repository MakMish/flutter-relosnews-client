class loginclass {
  String? emai;
  String? password;

  loginclass({this.emai, this.password});

  loginclass.fromJson(Map<String, dynamic> json) {
    emai = json['emai'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emai'] = this.emai;
    data['password'] = this.password;
    return data;
  }
}