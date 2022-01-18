class OrderSuccess {
  String message;
  Data data;

  OrderSuccess({this.message, this.data});

  OrderSuccess.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  Order order;
  Pickup pickup;
  Delevery delevery;
  Shipment shipment;
  LogHistory logHistory;

  Data(
      {this.order, this.pickup, this.delevery, this.shipment, this.logHistory});

  Data.fromJson(Map<String, dynamic> json) {
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
    pickup =
        json['pickup'] != null ? new Pickup.fromJson(json['pickup']) : null;
    delevery = json['delevery'] != null
        ? new Delevery.fromJson(json['delevery'])
        : null;
    shipment = json['shipment'] != null
        ? new Shipment.fromJson(json['shipment'])
        : null;
    logHistory = json['log_history'] != null
        ? new LogHistory.fromJson(json['log_history'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.order != null) {
      data['order'] = this.order.toJson();
    }
    if (this.pickup != null) {
      data['pickup'] = this.pickup.toJson();
    }
    if (this.delevery != null) {
      data['delevery'] = this.delevery.toJson();
    }
    if (this.shipment != null) {
      data['shipment'] = this.shipment.toJson();
    }
    if (this.logHistory != null) {
      data['log_history'] = this.logHistory.toJson();
    }
    return data;
  }
}

class Order {
  int userId;
  String actionType;
  int total;
  int pickupTotal;
  String trackingCode;
  Null barcode;
  int status;
  Null agent;
  String updatedAt;
  String createdAt;
  int id;

  Order(
      {this.userId,
      this.actionType,
      this.total,
      this.pickupTotal,
      this.trackingCode,
      this.barcode,
      this.status,
      this.agent,
      this.updatedAt,
      this.createdAt,
      this.id});

  Order.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    actionType = json['action_type'];
    total = json['total'];
    pickupTotal = json['pickup_total'];
    trackingCode = json['tracking_code'];
    barcode = json['barcode'];
    status = json['status'];
    agent = json['agent'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['action_type'] = this.actionType;
    data['total'] = this.total;
    data['pickup_total'] = this.pickupTotal;
    data['tracking_code'] = this.trackingCode;
    data['barcode'] = this.barcode;
    data['status'] = this.status;
    data['agent'] = this.agent;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}

class Pickup {
  int orderId;
  String pickupContact;
  String phone;
  String areaId;
  String description;
  String pickupTime;
  String updatedAt;
  String createdAt;
  int id;

  Pickup(
      {this.orderId,
      this.pickupContact,
      this.phone,
      this.areaId,
      this.description,
      this.pickupTime,
      this.updatedAt,
      this.createdAt,
      this.id});

  Pickup.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    pickupContact = json['pickup_contact'];
    phone = json['phone'];
    areaId = json['area_id'];
    description = json['description'];
    pickupTime = json['pickup_time'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['pickup_contact'] = this.pickupContact;
    data['phone'] = this.phone;
    data['area_id'] = this.areaId;
    data['description'] = this.description;
    data['pickup_time'] = this.pickupTime;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}

class Delevery {
  int orderId;
  String deliveryContact;
  String phone;
  String areaId;
  String description;
  String deliveryTime;
  String updatedAt;
  String createdAt;
  int id;

  Delevery(
      {this.orderId,
      this.deliveryContact,
      this.phone,
      this.areaId,
      this.description,
      this.deliveryTime,
      this.updatedAt,
      this.createdAt,
      this.id});

  Delevery.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    deliveryContact = json['delivery_contact'];
    phone = json['phone'];
    areaId = json['area_id'];
    description = json['description'];
    deliveryTime = json['delivery_time'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['delivery_contact'] = this.deliveryContact;
    data['phone'] = this.phone;
    data['area_id'] = this.areaId;
    data['description'] = this.description;
    data['delivery_time'] = this.deliveryTime;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}

class Shipment {
  int orderId;
  String weight;
  String description;
  String updatedAt;
  String createdAt;
  int id;

  Shipment(
      {this.orderId,
      this.weight,
      this.description,
      this.updatedAt,
      this.createdAt,
      this.id});

  Shipment.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    weight = json['weight'];
    description = json['description'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['weight'] = this.weight;
    data['description'] = this.description;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}

class LogHistory {
  int orderId;
  int statusId;
  String updatedAt;
  String createdAt;
  int id;

  LogHistory(
      {this.orderId, this.statusId, this.updatedAt, this.createdAt, this.id});

  LogHistory.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    statusId = json['status_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['status_id'] = this.statusId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
