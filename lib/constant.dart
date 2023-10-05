import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:our_store/core/local/cache_helper.dart';

var kPrimaryColor = HexColor('#022238');
var kSecondaryColor = HexColor('#843667');
const kWhiteColor = Colors.white;
String token = CacheHelper.getData(key: 'token') ?? '';

// ignore: constant_identifier_names
const String Cart = 'carts/';
