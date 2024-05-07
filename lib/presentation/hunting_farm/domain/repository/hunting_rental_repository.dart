import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:kelechek/data/main_api.dart';
import 'package:kelechek/di/injection.dart';

import 'package:kelechek/presentation/hunting_farm/domain/models/hunting_rental_list.dart';
import 'package:kelechek/presentation/hunting_farm/domain/models/rental_hunting_model.dart';

class RentalHuntingRepository {
  // Future<List<RentalHuntingMd>> getOfficePremesisList() async {
  //   try {
  //     final response = await rootBundle
  //         .loadString('assets/demo_content/rental-hunting.json');
  //     final kiyalListMd = (jsonDecode(response) as List<dynamic>)
  //         .map((e) => RentalHuntingMd.fromJson(e as Map<String, dynamic>))
  //         .toList();
  //     return kiyalListMd;
  //   } catch (e) {
  //     log(e.toString());
  //     throw Exception('Failed to load office premises');
  //   }
  // }

  Future getRentalHuntingData() async {
    final response = await locator<MainApi>().fetchRentalHuntingData();
    Iterable list = jsonDecode(response.body);
    return List<RentalHuntingModel>.from(
        list.map((e) => RentalHuntingModel.fromJson(e)));
  }
}
