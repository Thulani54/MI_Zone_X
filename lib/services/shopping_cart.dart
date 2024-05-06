import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ShoppingCartCubit extends Cubit<List<Map<String, dynamic>>> {
  final http.Client httpClient;
  final String ecommerceAPI = 'your_ecommerce_api_endpoint';
  List<Map<String, dynamic>> carts = [];

  ShoppingCartCubit({required this.httpClient}) : super([]);

  void addToCart(
      Map<String, dynamic> product, Map<String, dynamic> selectAttributes) {
    var productExistInCart = state.firstWhere(
        (p) => p['designation'] == product['designation'],
        orElse: () => {});

    if (productExistInCart.isEmpty) {
      product['selectAttributes'] = selectAttributes;
      product['num'] = 1;
      carts.add(product);
      emit(List.from(carts));
    } else {
      productExistInCart['num'] += 1;
      emit(List.from(carts));
    }
  }

  void removeFromCart(int index) {
    carts.removeAt(index);
    emit(List.from(carts));
  }

  double calcTotal() {
    return carts.fold(0, (double acc, pr) => acc + pr['num']);
  }

  double calcTotalPrice() {
    return carts.fold(0, (double acc, pr) => acc + (pr['price'] * pr['num']));
  }

  List<Map<String, dynamic>> getItems() {
    return carts;
  }

  List<Map<String, dynamic>> clearCart() {
    carts = [];
    emit(carts);
    return carts;
  }

  Future<void> load() async {
    if (state.isNotEmpty) {
      emit(state);
    } else {
      var response =
          await httpClient.get(Uri.parse('$ecommerceAPI/getEcomProducts'));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        processData(data);
      }
    }
  }

  void processData(Map<String, dynamic> data) {
    carts = data['Products_List']
        .map<Map<String, dynamic>>((p) => p as Map<String, dynamic>)
        .toList();
    emit(List.from(carts));
  }

  Stream<List<Map<String, dynamic>>> getProducts() async* {
    await load();
    yield state
      ..sort((a, b) {
        var aName = a['designation'].split(" ").last.toLowerCase();
        var bName = b['designation'].split(" ").last.toLowerCase();
        return aName.compareTo(bName);
      });
  }
}
