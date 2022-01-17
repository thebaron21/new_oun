class AuthenticationModel {
  String token;
  String message;
  User user;

  AuthenticationModel({this.token, this.message, this.user});

  AuthenticationModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  String phone;
  String name;
  String email;
  String image;
  String updatedAt;
  String createdAt;
  int id;

  User(
      {this.phone,
      this.name,
      this.email,
      this.image,
      this.updatedAt,
      this.createdAt,
      this.id});

  User.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['name'] = this.name;
    data['email'] = this.email;
    data['image'] = this.image;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
