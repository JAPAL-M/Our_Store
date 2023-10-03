class CartTotalPriceModel {
  CartTotalPriceModel({
      bool? status, 
      dynamic message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  CartTotalPriceModel.fromJson(dynamic json) {
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
      num? subTotal, 
      num? discount, 
      num? points, 
      num? total,}){
    _subTotal = subTotal;
    _discount = discount;
    _points = points;
    _total = total;
}

  Data.fromJson(dynamic json) {
    _subTotal = json['sub_total'];
    _discount = json['discount'];
    _points = json['points'];
    _total = json['total'];
  }
  num? _subTotal;
  num? _discount;
  num? _points;
  num? _total;

  num? get subTotal => _subTotal;
  num? get discount => _discount;
  num? get points => _points;
  num? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sub_total'] = _subTotal;
    map['discount'] = _discount;
    map['points'] = _points;
    map['total'] = _total;
    return map;
  }

}