import 'package:oon_client/logic/core/contracts/controllers.dart';

abstract class BaseHomeController extends Controller {
  tarckScreen();
  senderScreen();
  recevieScreen();
  buyScreen();

  nextPage();
  setLocation(); // 2
  backPage();
  goToTime();
  goToExtrInfo();
  goToBuy();
  goToDone();
  goToPick();
  goToAddSender();
}
