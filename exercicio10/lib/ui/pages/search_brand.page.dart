import 'package:exercicio10/enum/vehicle_type.enum.dart';
import 'package:exercicio10/model/brand.model.dart';
import 'package:exercicio10/service/api.service.dart';
import 'package:exercicio10/ui/widgets/search_box.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBrandPageArgs {
  final VehicleType vehicleType;

  SearchBrandPageArgs({
    this.vehicleType,
  });
}

class SearchBrandPage extends StatefulWidget {
  static const String route = '/searchBrand';
  final SearchBrandPageArgs args;

  SearchBrandPage(this.args);

  @override
  _SearchBrandPageState createState() => _SearchBrandPageState(args);
}

class _SearchBrandPageState extends State<SearchBrandPage> {
  final SearchBrandPageArgs args;

  _SearchBrandPageState(this.args);

  List<Brand> _brandOriginalList = [];
  List<Brand> _brandFiltredList = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadBrands();
  }

  _loadBrands() async {
    List<Brand> list = await ApiService().getBrands(_getVehicleType());
    setState(() {
      _brandOriginalList = list;
      _brandFiltredList = list;
    });
  }

  String _getVehicleType() {
    switch (args.vehicleType) {
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

  _showBrandList() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int position) {
        return Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 16,
              left: 15,
              bottom: 16,
            ),
            child: Text(
              _brandFiltredList[position].name,
              style: TextStyle(fontSize: 15),
            ),
          ),
        );
      },
      itemCount: _brandFiltredList.length,
    );
  }

  _onChangeBrand(value) {
    setState(() {
      _brandFiltredList = _brandOriginalList.where((brand) => brand.name.toUpperCase().contains(value.toString().toUpperCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getVehicleType()),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            SearchBox(
              text: 'Search for brands',
              onChange: _onChangeBrand,
            ),
            SizedBox(height: 5),
            Expanded(
              child: _showBrandList(),
            ),
          ],
        ),
      ),
    );
  }
}
