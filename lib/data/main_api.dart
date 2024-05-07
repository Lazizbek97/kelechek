import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:kelechek/data/api.dart';

@Injectable()
class MainApi {
  final Api _api;

  MainApi(this._api);
  Future<Response> getCategories() async {
    var data = await _api.get(path: 'category/all');
    return data;
  }

  Future<Response> fetchProductComments(int productId) async {
    var data = await _api.get(path: 'comment/productId/$productId');
    return data;
  }

  Future<Response> fetchCategoryProducts(String categoryId, int page) async {
    var data = await _api.get(path: 'product/categoryId/$categoryId/$page/10');
    return data;
  }

  Future<Response> fetchUserComments(String userId) async {
    var data = await _api.get(path: 'comment/clientId/$userId');
    return data;
  }

  Future<Response> fetchUser(String userID) async {
    var data = await _api.get(path: 'client/$userID');
    return data;
  }

  Future<Response> getCategoryProducts(String id) async {
    var data = await _api.get(path: 'category/$id');
    return data;
  }

  Future<Response> writeComment(
      int producId, int rating, String text, String clientId) async {
    final body = {
      "text": text,
      "rate": rating,
      "client_id": clientId,
      "product_id": producId
    };
    var data = await _api.post(path: 'comment', body: body);
    return data;
  }

  Future<Response> fetchShopDetails(String id) async {
    var data = await _api.get(path: 'salesman/$id');
    return data;
  }

  Future<Response> fetchProductDetails(int id) async {
    var data = await _api.get(path: 'product/details/$id');
    return data;
  }

  Future<Response> verfyPhone(String phone) async {
    final body = {"phone": phone};
    var data = await _api.post(path: 'otp/sendOtp', body: body);

    return data;
  }

  Future<Response> fetchRentalHuntingData() async {
    final body = {"search": ""};
    var data = await _api.get(path: 'product-filters', params: body);

    return data;
  }
}
