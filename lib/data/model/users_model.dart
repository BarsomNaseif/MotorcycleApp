class users_model {
  String? id;
  String? email;
  String? username;
  String? pic;
  String? phone;
  String? verifyOTP;
  String? passward;
  users_model(
      {this.id,
      this.email,
      this.username,
      this.pic,
      this.phone,
      this.verifyOTP,
      this.passward});

  users_model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    username = json['username'];
    pic = json['pic, '];
    phone = json['phone'];
    verifyOTP = json['verifyOTP'];
    passward = json['passward'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['username'] = this.username;
    data['pic, '] = this.pic;
    data['phone'] = this.phone;
    data['verifyOTP'] = this.verifyOTP;
    data['passward'] = this.passward;
    return data;
  }
}
