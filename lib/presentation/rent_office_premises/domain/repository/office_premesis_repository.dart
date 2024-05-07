import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:fpdart/fpdart.dart';
import 'package:kelechek/core/api_client/api_client.dart';
import 'package:kelechek/data/main_api.dart';
import 'package:kelechek/presentation/rent_office_premises/domain/model/office_premesis_md.dart';

import 'package:kelechek/presentation/rent_office_premises/domain/model/products_list_model.dart';
import 'package:kelechek/presentation/rent_office_premises/domain/model/registered_user_response.dart';
import 'package:http_parser/http_parser.dart';
import 'package:kelechek/presentation/rent_office_premises/domain/model/user_order_model.dart';

import '../../../../di/injection.dart';
import '../../../../l10n/l10n.dart';
import '../../../hunting_farm/domain/models/rental_hunting_model.dart';
import 'package:kelechek/presentation/rent_office_premises/domain/model/products_list_model.dart'
    as model;

class OfficePremesisRepository {
  ApiClient apiClient = ApiClient(
    baseUrl: 'https://kiyal.udpgov.fun',
    token: '21|QjzDJ3FBuXi8kejlyzm2u9Om7NT45sKPffYV6eYn63fba0e9',
  );

  Future<Either<Exception, List<ProductsListModel>>>
      getOfficePremesisList() async {
    final response = await apiClient.get(
      '/api/product-filters',
      fromJson: (json) => (json as List<dynamic>)
          .map((e) => ProductsListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
    return response;
  }

  // register user
  Future<Either<Exception, RegisteredUserResponse>> registerUser({
    required String fio,
    required String idcardNumber,
    required String idcardImage,
    required String selfieImage,
    required String passportImage,
  }) async {
    // convert to form data
    MultipartFile idcardImageFile = await MultipartFile.fromFile(
      idcardImage,
      filename: idcardImage.split('/').last,
      contentType: MediaType('image', 'jpeg'),
    );
    MultipartFile passportImageFile = await MultipartFile.fromFile(
      passportImage,
      filename: passportImage.split('/').last,
      contentType: MediaType('image', 'jpeg'),
    );
    MultipartFile selfieImageFile = await MultipartFile.fromFile(
      selfieImage,
      filename: selfieImage.split('/').last,
      contentType: MediaType('image', 'jpeg'),
    );
    FormData formData = FormData.fromMap(
      {
        "fio": fio,
        "identification_code": idcardNumber,
        "image1": idcardImageFile,
        "image2": passportImageFile,
        "image3": selfieImageFile,
      },
    );

    final response = await apiClient.post(
      '/api/registration',
      data: formData,
      fromJson: (json) {
        if ((json as Map<String, dynamic>).containsKey('id')) {
          return RegisteredUserResponse.fromJson(
            json,
          );
        }
        throw Exception('Error registering user');
      },
    );
    return response;
  }

  // create an order
  Future<Either<Exception, bool>> createOrder({
    required int userId,
    required int productId,
    required int quantity,
  }) async {
    final response = await apiClient.post(
      '/api/create-order',
      data: {
        "account_id": userId,
        "products[]": "$productId:$quantity",
      },
      fromJson: (json) {
        if ((json as Map<String, dynamic>).containsKey('id')) {
          return true;
        }
        throw Exception('Error creating order');
      },
    );
    return response;
  }

  // get all orders
  Future<Either<Exception, List<UserOrderModel>>> getAllOrders() async {
    final response = await apiClient.get(
      '/api/orders',
      fromJson: (json) => (json as List<dynamic>)
          .map((e) => UserOrderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
    return response;
  }

  Future fetchRentalHouses() async {
    final response = await locator<MainApi>().fetchRentalHuntingData();
    Iterable list = jsonDecode(response.body);
    return List<RentalHuntingModel>.from(
        list.map((e) => RentalHuntingModel.fromJson(e)));
  }

  List getProductImage(ProductsListModel data) {
    List images = [];
    if (data.values!.isNotEmpty) {
      for (var element in data.values!) {
        if (element.filter!.alias == "image" && element.fullFile!.isNotEmpty) {
          images = element.fullFile!.map((e) => e.toString()).toList();
        }
      }
    }
    return images;
  }

  String getProductDescription(
      ProductsListModel data, AppLocalizations currentLang) {
    print(currentLang.language);
    String description = "";
    if (data.values!.isNotEmpty) {
      for (var element in data.values!) {
        if (element.filter!.alias == "desc_en" ||
            element.filter!.alias == "desc_ru" ||
            element.filter!.alias == "desc_kg") {
          description = getDesc(element, currentLang.language);
        }
      }
    }
    return description;
  }

  String getAddress(ProductsListModel data, AppLocalizations currentLang) {
    print(currentLang.language);
    String address = "";
    if (data.values!.isNotEmpty) {
      for (var element in data.values!) {
        if (element.filter!.alias == "desc_en" ||
            element.filter!.alias == "desc_ru" ||
            element.filter!.alias == "desc_kg") {
          address = getDesc(element, currentLang.language);
        }
      }
    }
    return address;
  }

  String getPrice(ProductsListModel data, AppLocalizations currentLang) {
    String price = "";
    if (data.values!.isNotEmpty) {
      for (var element in data.values!) {
        if (element.filter!.alias == "price_month_ru" ||
            element.filter!.alias == "price_month_kg" ||
            element.filter!.alias == "price_month_en") {
          price = getDesc(element, currentLang.language);
        }
      }
    }
    return price;
  }

  String getFlat(ProductsListModel data, AppLocalizations currentLang) {
    String price = "";
    if (data.values!.isNotEmpty) {
      for (var element in data.values!) {
        if (element.filter!.alias == "area_ru" ||
            element.filter!.alias == "area_kg" ||
            element.filter!.alias == "area_en") {
          price = getDesc(element, currentLang.language);
        }
      }
    }
    return price;
  }

  List<String> getConvenince(
      ProductsListModel data, AppLocalizations currentLang) {
    List<String> convenince = [];

    if (data.values!.isNotEmpty) {
      for (var element in data.values!) {
        if (element.filter!.alias == "convenience_ru" ||
            element.filter!.alias == "convenience_kg" ||
            element.filter!.alias == "convenience_en") {
          if (element.filter!.values!.isNotEmpty) {
            for (var id in element.filter!.values!) {
              if (element.filterValueId == id.id) {
                convenince = getConv(id, currentLang);
              }
            }
          }
        }
      }
    }
    return convenince;
  }

  List<String> getfeatures(
      ProductsListModel data, AppLocalizations currentLang) {
    List<String> convenince = [];

    if (data.values!.isNotEmpty) {
      for (var element in data.values!) {
        if (element.filter!.alias == "features_kg" ||
            element.filter!.alias == "features_ru" ||
            element.filter!.alias == "features_en") {
          if (element.filter!.values!.isNotEmpty) {
            for (var id in element.filter!.values!) {
              if (element.filterValueId == id.id) {
                convenince = getConv(id, currentLang);
              }
            }
          }
        }
      }
    }
    return convenince;
  }

  List<String> getCondition(
      ProductsListModel data, AppLocalizations currentLang) {
    List<String> convenince = [];

    if (data.values!.isNotEmpty) {
      for (var element in data.values!) {
        if (element.filter!.alias == "condition_kg" ||
            element.filter!.alias == "condition_ru" ||
            element.filter!.alias == "condition_en") {
          if (element.filter!.values!.isNotEmpty) {
            for (var id in element.filter!.values!) {
              if (element.filterValueId == id.id) {
                convenince = getConv(id, currentLang);
              }
            }
          }
        }
      }
    }
    return convenince;
  }

  List<String> getConv(model.FilterValue value, AppLocalizations currentLang) {
    List<String> fff = [];

    if (currentLang.language == "En") {
      fff.add(value.value ?? "");
    } else if (currentLang.language == "KG") {
      fff.add(value.value ?? "");
    } else if (currentLang.language == "Рус") {
      fff.add(value.value ?? "");
    }

    return fff;
  }

  String getProductName(ProductsListModel data, AppLocalizations currentLang) {
    print(currentLang.language);
    String description = "";
    if (data.values!.isNotEmpty) {
      for (var element in data.values!) {
        if (element.filter!.alias == "prod_name_ru" ||
            element.filter!.alias == "prod_name_kg" ||
            element.filter!.alias == "prod_name_en") {
          description = getDesc(element, currentLang.language);
        }
      }
    }
    return description;
  }

  String getShortDesc(ProductsListModel data, AppLocalizations currentLang) {
    print(currentLang.language);
    String description = "";
    if (data.values!.isNotEmpty) {
      for (var element in data.values!) {
        if (element.filter!.alias == "short_desc_kg" ||
            element.filter!.alias == "short_desc_ru" ||
            element.filter!.alias == "short_desc_en") {
          description = getDesc(element, currentLang.language);
        }
      }
    }
    return description;
  }

  String getDesc(ProductsListModelValue alias, String lang) {
    String desc = "";
    if (lang == "En") {
      desc = alias.value!;
    } else if (lang == "KG") {
      desc = alias.value!;
    } else if (lang == "Рус") {
      desc = alias.value!;
    }
    print(desc);
    return desc;
  }
}

enum kyalType {
  image,
  description,
}
