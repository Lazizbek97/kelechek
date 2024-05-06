import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:kelechek/presentation/rental_home_with_service/domain/models/rental_homes_and_service_list.dart';

class RentalHomeAndServiceRepository {
  Future<List<RentalHomeAndServiceMd>> getOfficePremesisList() async {
    try {
      final response = await rootBundle
          .loadString('assets/demo_content/rental-house-with-service.json');
      final kiyalListMd = (jsonDecode(response) as List<dynamic>)
          .map(
              (e) => RentalHomeAndServiceMd.fromJson(e as Map<String, dynamic>))
          .toList();
      return kiyalListMd;
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to load office premises');
    }
  }
}
