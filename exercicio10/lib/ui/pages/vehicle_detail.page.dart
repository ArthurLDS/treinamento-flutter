import 'package:exercicio10/service/api.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:exercicio10/model/vehicledetail/vehicle_detail.model.dart';
import 'package:flutter/material.dart';

class VehicleDetailPageArgs {
  final String vehicleYearId;
  final String vehicleYearName;

  VehicleDetailPageArgs({
    this.vehicleYearId,
    this.vehicleYearName,
  });
}

class VehicleDetailPage extends StatefulWidget {
  static const String route = '/vehicleDetail';
  final VehicleDetailPageArgs args;

  VehicleDetailPage(this.args);

  @override
  _VehicleDetailPageState createState() => _VehicleDetailPageState(args);
}

class _VehicleDetailPageState extends State<VehicleDetailPage> {
  final VehicleDetailPageArgs args;

  _VehicleDetailPageState(this.args);

  VehicleDetailModel _vehicleDetail;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadDetail();
  }

  _loadDetail() async {
    VehicleDetailModel detail =
        await ApiService().getVehicleDetail(args.vehicleYearId);
    setState(() {
      _vehicleDetail = detail;
    });
  }

  _loadContent() {
    return _vehicleDetail != null
        ? Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            child: Card(
              elevation: 2,
              child: Container(
                width: double.infinity,
                height: 250,
                padding: const EdgeInsets.only(
                  top: 25,
                  left: 15,
                  bottom: 25,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _vehicleDetail.name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 25),
                    Text(
                      'Year model: ${_vehicleDetail.anoModelo}',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Fuel: ${_vehicleDetail.combustivel}',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Brand: ${_vehicleDetail.marca}',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Value: ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '${_vehicleDetail.preco}',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Reference: ${_vehicleDetail.referencia}',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(args.vehicleYearName),
      ),
      body: Container(
        child: _loadContent(),
      ),
    );
  }
}
