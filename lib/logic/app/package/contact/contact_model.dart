
class Phone {
  final String number;
  final String name;

  Phone(this.number, this.name);

  Phone.toObject(var json)
      : number = json["phoneNumber"]["number"],
        name = json["fullName"];
}