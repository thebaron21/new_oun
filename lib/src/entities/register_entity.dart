class RegisterEntity {
  final String phone;
  String opt;

  RegisterEntity({this.phone, this.opt});
  toMap() => {
        "phone": phone,
      };
  RegisterEntity.fromMap(Map<String, dynamic> json)
      : phone = json["phone"],
        opt = json["opt"];
}
