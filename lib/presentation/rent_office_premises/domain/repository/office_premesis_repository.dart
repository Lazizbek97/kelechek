import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:kelechek/core/api_client/api_client.dart';

import 'package:kelechek/presentation/rent_office_premises/domain/model/products_list_model.dart';
import 'package:kelechek/presentation/rent_office_premises/domain/model/registered_user_response.dart';
import 'package:http_parser/http_parser.dart';
import 'package:kelechek/presentation/rent_office_premises/domain/model/user_order_model.dart';

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
}
