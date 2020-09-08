import 'package:exercicio10/model/enum/vehicle_type.enum.dart';

class VehicleUtil {

  static String getVehicleTypeName(VehicleType type) {
    switch (type) {
      case VehicleType.CAR:
        {
          return "Cars";
        }
        break;
      case VehicleType.MOTORCYCLE:
        {
          return "Motorcycles";
        }
        break;
      default:
        {
          return "Trucks";
        }
        break;
    }
  }
}