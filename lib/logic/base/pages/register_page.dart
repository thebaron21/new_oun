import 'package:oon_client/logic/app/pages/auth/register.dart';

import 'package:oon_client/logic/base/bindings/Authentcation_bindings.dart';
import 'package:oon_client/logic/core/contracts/page.dart';

class RegisterPage extends Page {
  RegisterPage()
      : super(
          name: '/',
          page: RegisterScreen(),
          binding: AuthenticationBindings(),
        );
}
