import 'package:exercicio10/model/enum/vehicle_type.enum.dart';
import 'package:exercicio10/ui/pages/search_brand.page.dart';
import 'package:exercicio10/ui/widgets/button_menu.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String route = '';

  _goToCarsBrand(BuildContext context) {
    return Navigator.of(context).pushNamed(SearchBrandPage.route,
        arguments: SearchBrandPageArgs(vehicleType: VehicleType.CAR));
  }

  _goToMotorcycleBrand(BuildContext context) {
    return Navigator.of(context).pushNamed(SearchBrandPage.route,
        arguments: SearchBrandPageArgs(vehicleType: VehicleType.MOTORCYCLE));
  }

  _goToTruckBrand(BuildContext context) {
    return Navigator.of(context).pushNamed(SearchBrandPage.route,
        arguments: SearchBrandPageArgs(vehicleType: VehicleType.TRUCK));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FIPE Table'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonMenu(
              title: 'Cars',
              icon: Icons.directions_car,
              onPress: () => _goToCarsBrand(context),
            ),
            SizedBox(height: 15),
            ButtonMenu(
              title: 'Motorcycles',
              icon: Icons.motorcycle,
              onPress: () => _goToMotorcycleBrand(context),
            ),
            SizedBox(height: 15),
            ButtonMenu(
              title: 'Trucks',
              icon: Icons.local_shipping,
              onPress: () => _goToTruckBrand(context),
            ),
          ],
        ),
      ),
    );
  }
}