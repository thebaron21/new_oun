import 'package:oon_client/src/entities/register_entity.dart';

class SignUpRepository {
  RegisterEntity registerEntity;
  String error;

  SignUpRepository.fromModel(Map<String, dynamic> json)
      : registerEntity = RegisterEntity(phone: json["phone"], opt: json["opt"]),
        error = null;

  SignUpRepository.withError(String e)
      : registerEntity = null,
        error = e;
}
