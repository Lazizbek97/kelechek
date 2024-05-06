import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';

import 'package:kelechek/presentation/kindergardens/domain/models/kindergarden_list_md.dart';

class KindergardenRepository {
  Future<List<KindergardenMd>> getOfficePremesisList() async {
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
}
