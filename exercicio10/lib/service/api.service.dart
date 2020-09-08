import 'dart:convert';
import 'package:exercicio10/model/vehiclebrand/brand.model.dart';
import 'package:exercicio10/model/vehiclemodel/vehicle_model.model.dart';
import 'package:exercicio10/model/vehicleyear/vehicle_year.model.dart';
import 'package:exercicio10/model/vehicledetail/vehicle_detail.model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String BASE_URL = 'https://fipeapi.appspot.com/api/1/';
  static String vehicleType = "";
  static String vehicleBrandId = "";
  static String vehicleModelId = "";

  Future<List<Brand>> getBrands(String type) async {
    final response = await http.get('$BASE_URL$type/marcas.json');
    try {
      var list = json.decode(response.body) as List;
      vehicleType = type;
      return list.map((i) => Brand.fromJson(i)).toList();
    } catch (e) {
      print(e);
    }
  }

  Future<List<VehileModel>> getVehicleModels(String id) async {
    final response = await http.get('$BASE_URL$vehicleType/veiculos/$id.json');
    try {
      var list = json.decode(response.body) as List;
      vehicleBrandId = id;
      return list.map((i) => VehileModel.fromJson(i)).toList();
    } catch (e) {
      print(e);
    }
  }

  Future<List<VehicleYear>> getVehicleYear(String id) async {
    final response = await http.get('$BASE_URL$vehicleType/veiculo/$vehicleBrandId/$id.json');
    try {
      var list = json.decode(response.body) as List;
      vehicleModelId = id;
      return list.map((i) => VehicleYear.fromJson(i)).toList();
    } catch (e) {
      print(e);
    }
  }

  Future<VehicleDetailModel> getVehicleDetail(String id) async {
    final response = await http.get('$BASE_URL$vehicleType/veiculo/$vehicleBrandId/$vehicleModelId/$id.json');
    try {
      var result = json.decode(response.body);
      return VehicleDetailModel.fromJson(result);
    } catch (e) {
      print(e);
    }
  }

}
