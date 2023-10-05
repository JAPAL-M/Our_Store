import 'package:our_store/features/home/data/models/HomeModel.dart';




class CartModel {
  CartModel({
      bool? status, 
      dynamic message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  CartModel.fromJson(dynamic json) {
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
      List<CartItems>? cartItems, 
      num? subTotal, 
      num? total,}){
    _cartItems = cartItems;
    _subTotal = subTotal;
    _total = total;
}

  Data.fromJson(dynamic json) {
    if (json['cart_items'] != null) {
      _cartItems = [];
      json['cart_items'].forEach((v) {
        _cartItems?.add(CartItems.fromJson(v));
      });
    }
    _subTotal = json['sub_total'];
    _total = json['total'];
  }
  List<CartItems>? _cartItems;
  num? _subTotal;
  num? _total;

  List<CartItems>? get cartItems => _cartItems;
  num? get subTotal => _subTotal;
  num? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_cartItems != null) {
      map['cart_items'] = _cartItems?.map((v) => v.toJson()).toList();
    }
    map['sub_total'] = _subTotal;
    map['total'] = _total;
    return map;
  }

}

class CartItems {
  CartItems({
      num? id, 
      num? quantity, 
      Products? product,}){
    _id = id;
    quantity = quantity;
    _product = product;
}

  CartItems.fromJson(dynamic json) {
    _id = json['id'];
    quantity = json['quantity'];
    _product = json['product'] != null ? Products.fromJson(json['product']) : null;
  }
  num? _id;
  num? quantity;
  Products? _product;

  num? get id => _id;
  Products? get product => _product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['quantity'] = quantity;
    if (_product != null) {
      map['product'] = _product?.toJson();
    }
    return map;
  }

}