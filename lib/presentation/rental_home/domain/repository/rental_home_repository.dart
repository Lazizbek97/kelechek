import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:kelechek/data/main_api.dart';

import 'package:kelechek/presentation/rental_home/domain/models/rental_homes_list.dart';
import 'package:kelechek/presentation/rental_home_with_service/domain/models/rental_homes_and_service_list.dart';

import '../../../../di/injection.dart';
import '../../../hunting_farm/domain/models/hunting_rental_list.dart';
import '../../../hunting_farm/domain/models/rental_hunting_model.dart';
import '../../../kindergardens/domain/models/kindergarden_list_md.dart';
import '../../../rent_office_premises/domain/model/office_premesis_md.dart';

@Injectable()
class RentalHomeRepository {
  Future<List<RentalHousesMd>> getRentalHomesList() async {
    try {
      final response =
          await rootBundle.loadString('assets/demo_content/rental-houses.json');
      final kiyalListMd = (jsonDecode(response) as List<dynamic>)
          .map((e) => RentalHousesMd.fromJson(e as Map<String, dynamic>))
          .toList();
      return kiyalListMd;
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to load office premises');
    }
  }

  Future<List<KindergardenMd>> getkindergardenList() async {
    try {
      final response =
          await rootBundle.loadString('assets/demo_content/kindergarden.json');
      final kiyalListMd = (jsonDecode(response) as List<dynamic>)
          .map((e) => KindergardenMd.fromJson(e as Map<String, dynamic>))
          .toList();
      return kiyalListMd;
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to load office premises');
    }
  }

  Future<List<RentalHuntingMd>> getrentalHuntingList() async {
    try {
      final response = await rootBundle
          .loadString('assets/demo_content/rental-hunting.json');
      final kiyalListMd = (jsonDecode(response) as List<dynamic>)
          .map((e) => RentalHuntingMd.fromJson(e as Map<String, dynamic>))
          .toList();
      return kiyalListMd;
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to load office premises');
    }
  }

  Future<List<KiyalListMd>> getrentalKyalList() async {
    try {
      final response =
          await rootBundle.loadString('assets/demo_content/rental-kyal.json');
      final kiyalListMd = (jsonDecode(response) as List<dynamic>)
          .map((e) => KiyalListMd.fromJson(e as Map<String, dynamic>))
          .toList();
      return kiyalListMd;
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to load office premises');
    }
  }

  Future<List<RentalHomeAndServiceMd>> getrentalHomeServices() async {
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
