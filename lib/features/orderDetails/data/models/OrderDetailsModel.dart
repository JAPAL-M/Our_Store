class OrderDetailsModel {
  OrderDetailsModel({
      bool? status, 
      dynamic message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  OrderDetailsModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  dynamic _message;
  Data? _data;

  bool? get status => _status;
  dynamic get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      num? id, 
      num? cost, 
      num? discount, 
      num? points, 
      num? vat, 
      num? total, 
      num? pointsCommission, 
      String? promoCode, 
      String? paymentMethod, 
      String? date, 
      String? status, 
      Address? address, 
      List<ProductsOrder>? products,}){
    _id = id;
    _cost = cost;
    _discount = discount;
    _points = points;
    _vat = vat;
    _total = total;
    _pointsCommission = pointsCommission;
    _promoCode = promoCode;
    _paymentMethod = paymentMethod;
    _date = date;
    _status = status;
    _address = address;
    _products = products;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _cost = json['cost'];
    _discount = json['discount'];
    _points = json['points'];
    _vat = json['vat'];
    _total = json['total'];
    _pointsCommission = json['points_commission'];
    _promoCode = json['promo_code'];
    _paymentMethod = json['payment_method'];
    _date = json['date'];
    _status = json['status'];
    _address = json['address'] != null ? Address.fromJson(json['address']) : null;
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(ProductsOrder.fromJson(v));
      });
    }
  }
  num? _id;
  num? _cost;
  num? _discount;
  num? _points;
  num? _vat;
  num? _total;
  num? _pointsCommission;
  String? _promoCode;
  String? _paymentMethod;
  String? _date;
  String? _status;
  Address? _address;
  List<ProductsOrder>? _products;

  num? get id => _id;
  num? get cost => _cost;
  num? get discount => _discount;
  num? get points => _points;
  num? get vat => _vat;
  num? get total => _total;
  num? get pointsCommission => _pointsCommission;
  String? get promoCode => _promoCode;
  String? get paymentMethod => _paymentMethod;
  String? get date => _date;
  String? get status => _status;
  Address? get address => _address;
  List<ProductsOrder>? get products => _products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['cost'] = _cost;
    map['discount'] = _discount;
    map['points'] = _points;
    map['vat'] = _vat;
    map['total'] = _total;
    map['points_commission'] = _pointsCommission;
    map['promo_code'] = _promoCode;
    map['payment_method'] = _paymentMethod;
    map['date'] = _date;
    map['status'] = _status;
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class ProductsOrder {
  ProductsOrder({
      num? id, 
      num? quantity, 
      num? price, 
      String? name, 
      String? image,}){
    _id = id;
    _quantity = quantity;
    _price = price;
    _name = name;
    _image = image;
}

  ProductsOrder.fromJson(dynamic json) {
    _id = json['id'];
    _quantity = json['quantity'];
    _price = json['price'];
    _name = json['name'];
    _image = json['image'];
  }
  num? _id;
  num? _quantity;
  num? _price;
  String? _name;
  String? _image;

  num? get id => _id;
  num? get quantity => _quantity;
  num? get price => _price;
  String? get name => _name;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['quantity'] = _quantity;
    map['price'] = _price;
    map['name'] = _name;
    map['image'] = _image;
    return map;
  }

}

class Address {
  Address({
      num? id, 
      String? name, 
      String? city, 
      String? region, 
      String? details, 
      String? notes, 
      num? latitude, 
      num? longitude,}){
    _id = id;
    _name = name;
    _city = city;
    _region = region;
    _details = details;
    _notes = notes;
    _latitude = latitude;
    _longitude = longitude;
}

  Address.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _city = json['city'];
    _region = json['region'];
    _details = json['details'];
    _notes = json['notes'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
  }
  num? _id;
  String? _name;
  String? _city;
  String? _region;
  String? _details;
  String? _notes;
  num? _latitude;
  num? _longitude;

  num? get id => _id;
  String? get name => _name;
  String? get city => _city;
  String? get region => _region;
  String? get details => _details;
  String? get notes => _notes;
  num? get latitude => _latitude;
  num? get longitude => _longitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['city'] = _city;
    map['region'] = _region;
    map['details'] = _details;
    map['notes'] = _notes;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    return map;
  }

}