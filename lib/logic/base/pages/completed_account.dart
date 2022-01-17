
//



import 'package:oon_client/logic/app/pages/auth/complete_account.dart';
import 'package:oon_client/logic/base/bindings/Authentcation_bindings.dart';
import 'package:oon_client/logic/core/contracts/page.dart';

class CompletedAccountPage extends Page {
  CompletedAccountPage()
      : super(
          name: '/next',
          page: CompleteAccountScreen(),
          binding: AuthenticationBindings(),
        );
}
