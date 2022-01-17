import 'package:flutter/material.dart';
import 'package:oon_client/src/view_models/order_step_three_viewmodel.dart';
import 'package:stacked/stacked.dart';

class OrderStepThreeOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder:
          (BuildContext context, OrderStepThreeViewModel model, Widget child) {
        return Scaffold();
      },
      viewModelBuilder: () => OrderStepThreeViewModel(),
    );
  }
}
