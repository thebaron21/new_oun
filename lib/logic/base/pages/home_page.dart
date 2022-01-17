
import 'package:oon_client/logic/app/pages/home_screen.dart';
import 'package:oon_client/logic/base/bindings/home_bindings.dart';
import 'package:oon_client/logic/core/contracts/page.dart';

class HomePage extends Page {
  HomePage() : super(
    name: "/home",
    page: HomeScreen(),
    binding: HomeBindings()
  );
}
