import 'dart:io';

import 'package:oon_client/logic/app/models/profile_model.dart';
import 'package:oon_client/logic/core/contracts/controllers.dart';

abstract class AuthenticationController<Model> extends Controller {
  Future<Model> login(String email, String password);
  Future<Model> register(user);
  Future<Model> updateUser(String id, String name);
}
