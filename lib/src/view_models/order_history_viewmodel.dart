import '../helpers/color_pattern.dart';
import 'package:stacked/stacked.dart';

class OrderHistoryViewModel extends BaseViewModel {
  ColorPattern colorPattern = ColorPattern();

  OrderStatus _orderStatus = OrderStatus.Inprogress;

  OrderStatus get orderStatus => _orderStatus;
  set orderStatus(OrderStatus status) {
    _orderStatus = status;
    notifyListeners();
  }
}

enum OrderStatus { Completed, Inprogress }
