class OrderModel {
  final String userId;
  final String pickupContact;
  final String pickupPhone;
  final String pickupAreaId;
  final String pickupDescription;
  final String pickupTime;

  final String deliveryContact;
  final String deliveryPhone;
  final String deliveryAreaId;
  final String deliveryDescription;
  final String deliveryTime;

  final String weight;
  final String shipmentDescription;

  OrderModel(
      {this.userId,
      this.pickupContact,
      this.pickupPhone,
      this.pickupAreaId,
      this.pickupDescription,
      this.pickupTime,
      this.deliveryContact,
      this.deliveryPhone,
      this.deliveryAreaId,
      this.deliveryDescription,
      this.deliveryTime,
      this.weight,
      this.shipmentDescription});

  toJson(String type) => {
        "user_id": userId,
        "action_type": type,
        "pickup_contact": pickupContact,
        "pickup_phone": pickupPhone,
        "pickup_area_id": pickupAreaId,
        "pickup_description": pickupDescription,
        "pickup_time": pickupTime,
        "delivery_contact": deliveryContact,
        "delivery_phone": deliveryPhone,
        "delivery_area_id": deliveryAreaId,
        "delivery_description": deliveryDescription,
        "delivery_time": deliveryTime,
        "shipment_description": shipmentDescription,
        "weight": weight,
      };
}
