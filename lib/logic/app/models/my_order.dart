class MyOrder {
  int id;
  String userId;
  String actionType;
  String total;
  String pickupTotal;
  String trackingCode;
  String barcode;
  String status;
  String agent;
  String createdAt;
  String updatedAt;
  Pickup pickup;
  Delivery delivery;
  Shipment shipment;

  MyOrder({
    this.id,
    this.userId,
    this.actionType,
    this.total,
    this.pickupTotal,
    this.trackingCode,
    this.barcode,
    this.status,
    this.agent,
    this.createdAt,
    this.updatedAt,
    this.pickup,
    this.delivery,
    this.shipment,
  });

  MyOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'] ?? "";
    actionType = json['action_type'] ?? "";
    total = json['total'] ?? "";
    pickupTotal = json['pickup_total'] ?? "";
    trackingCode = json['tracking_code'] ?? "";
    barcode = json['barcode'] ?? "";
    status = json['status'] ?? "";
    agent = json['agent'] ?? "";
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pickup =
        json['pickup'] != null ? new Pickup.fromJson(json['pickup']) : null;
    delivery = json['delivery'] != null
        ? new Delivery.fromJson(json['delivery'])
        : null;
    shipment = json['shipment'] != null
        ? new Shipment.fromJson(json['shipment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['action_type'] = this.actionType;
    data['total'] = this.total;
    data['pickup_total'] = this.pickupTotal;
    data['tracking_code'] = this.trackingCode;
    data['barcode'] = this.barcode;
    data['status'] = this.status;
    data['agent'] = this.agent;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pickup != null) {
      data['pickup'] = this.pickup.toJson();
    }
    if (this.delivery != null) {
      data['delivery'] = this.delivery.toJson();
    }
    if (this.shipment != null) {
      data['shipment'] = this.shipment.toJson();
    }
    return data;
  }
}

class Pickup {
  int id;
  String orderId;
  String areaId;
  String pickupContact;
  String phone;
  String description;
  String pickupTime;
  String createdAt;
  String updatedAt;

  Pickup(
      {this.id,
      this.orderId,
      this.areaId,
      this.pickupContact,
      this.phone,
      this.description,
      this.pickupTime,
      this.createdAt,
      this.updatedAt});

  Pickup.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'] ?? "";
    areaId = json['area_id'] ?? "";
    pickupContact = json['pickup_contact'] ?? "";
    phone = json['phone'] ?? "";
    description = json['description'] ?? "";
    pickupTime = json['pickup_time'] ?? "";
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['area_id'] = this.areaId;
    data['pickup_contact'] = this.pickupContact;
    data['phone'] = this.phone;
    data['description'] = this.description;
    data['pickup_time'] = this.pickupTime;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Delivery {
  int id;
  String orderId;
  String areaId;
  String deliveryContact;
  String phone;
  String description;
  String deliveryTime;
  String createdAt;
  String updatedAt;

  Delivery(
      {this.id,
      this.orderId,
      this.areaId,
      this.deliveryContact,
      this.phone,
      this.description,
      this.deliveryTime,
      this.createdAt,
      this.updatedAt});

  Delivery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    areaId = json['area_id'];
    deliveryContact = json['delivery_contact'] ?? "";
    phone = json['phone'] ?? "";
    description = json['description'] ?? "";
    deliveryTime = json['delivery_time'] ?? "";
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['area_id'] = this.areaId;
    data['delivery_contact'] = this.deliveryContact;
    data['phone'] = this.phone;
    data['description'] = this.description;
    data['delivery_time'] = this.deliveryTime;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Shipment {
  int id;
  String orderId;
  String weight;
  String description;
  String createdAt;
  String updatedAt;

  Shipment(
      {this.id,
      this.orderId,
      this.weight,
      this.description,
      this.createdAt,
      this.updatedAt});

  Shipment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    weight = json['weight'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['weight'] = this.weight;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
