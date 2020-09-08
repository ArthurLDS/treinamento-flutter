import 'package:exercicio10/model/vehiclemodel/vehicle_model.model.dart';
import 'package:exercicio10/service/api.service.dart';
import 'package:exercicio10/ui/pages/search_year.page.dart';
import 'package:exercicio10/ui/widgets/card_list.dart';
import 'package:exercicio10/ui/widgets/search_box.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchModelPageArgs {
  final String vehicleBrandId;
  final String vehicleBrandName;

  SearchModelPageArgs({
    this.vehicleBrandId,
    this.vehicleBrandName,
  });
}

class SearchModelPage extends StatefulWidget {
  static const String route = '/searchModel';
  final SearchModelPageArgs args;

  SearchModelPage(this.args);

  @override
  _SearchModelPageState createState() => _SearchModelPageState(args);
}

class _SearchModelPageState extends State<SearchModelPage> {
  final SearchModelPageArgs args;

  _SearchModelPageState(this.args);

  List<VehileModel> _vehicleOriginalList = [];
  List<VehileModel> _vehicleFiltredList = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadModels();
  }

  _loadModels() async {
    List<VehileModel> list =
        await ApiService().getVehicleModels(args.vehicleBrandId);
    setState(() {
      _vehicleOriginalList = list;
      _vehicleFiltredList = list;
    });
  }

  _showModelsList() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int position) {
        VehileModel model = _vehicleFiltredList[position];
        return CardList(
          title: model.fipeName,
          onPress: () => _onPressModel(model.id, model.fipeName),
        );
      },
      itemCount: _vehicleFiltredList.length,
    );
  }

  _onPressModel(String id, String modelName) {
    return Navigator.of(context).pushNamed(SearchYearPage.route,
        arguments: SearchYearPageArgs(
            vehicleModelId: id, vehicleModelName: modelName));
  }

  _onChangeModel(value) {
    setState(() {
      _vehicleFiltredList = _vehicleOriginalList
          .where((model) =>
              model.name.toUpperCase().contains(value.toString().toUpperCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(args.vehicleBrandName),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            SearchBox(
              text: 'Search for models',
              onChange: _onChangeModel,
            ),
            SizedBox(height: 5),
            Expanded(
              child: _showModelsList(),
            ),
          ],
        ),
      ),
    );
  }
}
