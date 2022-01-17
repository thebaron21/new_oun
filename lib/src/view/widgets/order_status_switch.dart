import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../helpers/color_pattern.dart';
import '../../view_models/order_history_viewmodel.dart';

class OrderStatusSwitch extends StatelessWidget {
  const OrderStatusSwitch({
    Key key,
    @required this.colorPattern,
    @required this.model,
  }) : super(key: key);

  final ColorPattern colorPattern;
  final OrderHistoryViewModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorPattern.primaryColor,
      padding: EdgeInsets.all(1),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                model.orderStatus = OrderStatus.Completed;
              },
              child: Container(
                padding: EdgeInsets.all(8),
                color: model.orderStatus == OrderStatus.Completed
                    ? colorPattern.primaryColor
                    : Colors.white,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('مكتملة'),
                      SvgPicture.asset(
                        'assets/images/svg/ic_completed.svg',
                        semanticsLabel: 'Acme Logo',
                        color: model.orderStatus == OrderStatus.Completed
                            ? Colors.white
                            : colorPattern.primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                model.orderStatus = OrderStatus.Inprogress;
              },
              child: Container(
                padding: EdgeInsets.all(8),
                color: model.orderStatus == OrderStatus.Inprogress
                    ? colorPattern.primaryColor
                    : Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('قيد التنفيذ'),
                    SvgPicture.asset('assets/images/svg/ic_inprogress.svg',
                        semanticsLabel: 'Acme Logo',
                        color: model.orderStatus == OrderStatus.Inprogress
                            ? Colors.white
                            : colorPattern.primaryColor),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
