import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kelechek/presentation/home_cart/data/order/orders_model.dart';
import 'package:kelechek/presentation/home_chat/data/model/home_chats_model.dart';
import 'package:kelechek/presentation/user_indentification/data/user_data/user_model.dart';
import 'package:path_provider/path_provider.dart';

const String _boxOrder = 'orders';
const String _boxUser = 'user';
const String _boxHomeChats = 'home_chats';

class HiveService {
  late Box<OrdersModel> _ordersBox; // Store a list of OrdersModel
  late Box<UserMoodel> user; // Store user details
  late Box<HomeChatsModel> homeChats; // Store home chats
  late Directory appDirPath;

  Future<HiveService> init() async {
    appDirPath = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDirPath.path);
    Hive
      ..registerAdapter(OrdersModelAdapter())
      ..registerAdapter(UserMoodelAdapter())
      ..registerAdapter(HomeChatsModelAdapter());

    _ordersBox = await Hive.openBox<OrdersModel>(_boxOrder);
    user = await Hive.openBox<UserMoodel>(_boxUser);
    homeChats = await Hive.openBox<HomeChatsModel>(_boxHomeChats);

    return this;
  }

// users box
  Future<void> addUser(UserMoodel userMoodel) async {
    await user.put(_boxUser, userMoodel);
  }

  UserMoodel? get getUser => user.get(_boxUser) ?? UserMoodel();

  // orders box
  Future<void> deleteOrder(OrdersModel order) async {
    await _ordersBox.delete(order.key);
  }

  ValueListenable<Box<OrdersModel>> get ordersBox => _ordersBox.listenable();

  Future<void> addOrder(OrdersModel order) async {
    await _ordersBox.add(order);
  }

  List<OrdersModel> getOrders() {
    try {
      return _ordersBox.values.toList();
    } catch (e) {
      return [];
    }
  }

  List<OrdersModel> get orders => _ordersBox.values.toList();

  // home chats box
  Future<void> addHomeChat(HomeChatsModel homeChatsModel) async {
    await homeChats.add(homeChatsModel);
  }

  List<HomeChatsModel> getHomeChats() {
    try {
      return homeChats.values.toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> deleteHomeChat(HomeChatsModel homeChatsModel) async {
    await homeChats.delete(homeChatsModel.key);
  }

  ValueListenable<Box<HomeChatsModel>> get homeChatsBox =>
      homeChats.listenable();

  Future<void> clearBoxes() async {
    await _ordersBox.clear();
    await user.clear();
    await homeChats.clear();
  }
}
