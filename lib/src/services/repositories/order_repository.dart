

class OrderFetchModel {
  String date;
  String area;
  String trackingCode;
  String nameRecive;
  String orderStatusId;
  String deliveryTime;

  OrderFetchModel(this.date, this.area, this.trackingCode, this.nameRecive,
      this.orderStatusId, this.deliveryTime);

  OrderFetchModel.fromMap(var json)
      : date = json["pickups"]["pickup_day_id"],
        area = json["pickups"]["area_id"],
        trackingCode = json["tracking_code"],
        nameRecive = json["pickups"]["pickup_contact"],
        orderStatusId = json["order_status_id"],
        deliveryTime = json["delivery"]["delivery_time"];
}

// pickup_day_id
class OrderRepository {
  List<OrderFetchModel> orders = [];
  String error;

  OrderRepository.fromJson(var json)
      : orders = (json as List).map((e) => OrderFetchModel.fromMap(e)).toList(),
        error = "";
  OrderRepository.withError(String ex)
      : orders = [],
        error = ex;
}
