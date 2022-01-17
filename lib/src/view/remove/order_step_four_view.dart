import 'package:flutter/material.dart';
import 'package:oon_client/src/view_models/order_step_four_viewmodel.dart';
import 'package:stacked/stacked.dart';

class OrderStepFourOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        builder:
            (BuildContext context, OrderStepFourViewModel model, Widget child) {
          return Scaffold();
        },
        viewModelBuilder: () => OrderStepFourViewModel());
  }
}
