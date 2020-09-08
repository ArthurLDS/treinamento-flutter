import 'package:exercicio10/service/api.service.dart';
import 'package:exercicio10/ui/pages/vehicle_detail.page.dart';
import 'package:exercicio10/ui/widgets/card_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:exercicio10/model/vehicleyear/vehicle_year.model.dart';
import 'package:flutter/material.dart';

class SearchYearPageArgs {
  final String vehicleModelId;
  final String vehicleModelName;

  SearchYearPageArgs({
    this.vehicleModelId,
    this.vehicleModelName,
  });
}

class SearchYearPage extends StatefulWidget {
  static const String route = '/searchYear';
  final SearchYearPageArgs args;

  SearchYearPage(this.args);

  @override
  _SearchYearPageState createState() => _SearchYearPageState(args);
}

class _SearchYearPageState extends State<SearchYearPage> {
  final SearchYearPageArgs args;

  _SearchYearPageState(this.args);

  List<VehicleYear> _vehicleYearList = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadYears();
  }

  _loadYears() async {
    List<VehicleYear> list =
        await ApiService().getVehicleYear(args.vehicleModelId);
    setState(() {
      _vehicleYearList = list;
    });
  }

  _showYearList() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int position) {
        VehicleYear year = _vehicleYearList[position];
        return CardList(
          title: _vehicleYearList[position].fipeCodigo,
          onPress: () => _onPressYear(year.id.toString(), year.name),
        );
      },
      itemCount: _vehicleYearList.length,
    );
  }

  _onPressYear(String id, String yearName) {
    return Navigator.of(context).pushNamed(VehicleDetailPage.route,
        arguments: VehicleDetailPageArgs(
            vehicleYearId: id, vehicleYearName: yearName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(args.vehicleModelName),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: _showYearList(),
      ),
    );
  }
}
