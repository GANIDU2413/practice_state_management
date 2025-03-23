import 'package:begin_statemanagement/models/cart_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier{
  Map <String , CartItem> _item = {};
}