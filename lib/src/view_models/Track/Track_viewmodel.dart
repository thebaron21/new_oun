import '../../helpers/color_pattern.dart';
import 'package:stacked/stacked.dart';

class TrackViewModel extends BaseViewModel {
  ColorPattern colorPattern = ColorPattern();

  OrderStatus4 _orderStatus4 = OrderStatus4.Inprogress;

  OrderStatus4 get orderStatus4 => _orderStatus4;
  set orderStatus(OrderStatus4 status4) {
    _orderStatus4 = status4;
    notifyListeners();
  }
}

enum OrderStatus4 { Completed, Inprogress }
