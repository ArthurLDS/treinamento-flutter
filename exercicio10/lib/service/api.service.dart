import 'dart:convert';
import 'package:exercicio10/model/brand.model.dart';
import 'package:http/http.dart' as http;
class ApiService {

  static const String BASE_URL = 'https://fipeapi.appspot.com/api/1/';

  Future<List<Brand>> getBrands(String typeVehile) async {
    final response = await http.get('$BASE_URL$typeVehile/marcas.json');
    try {
      var list = json.decode(response.body) as List;
      print(list);
      return list.map((i) => Brand.fromJson(i)).toList();
    } catch (e) {
      print(e);
    }
  }
}
