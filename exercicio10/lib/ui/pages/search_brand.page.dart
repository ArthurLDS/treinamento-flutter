import 'package:exercicio10/model/enum/vehicle_type.enum.dart';
import 'package:exercicio10/model/vehiclebrand/brand.model.dart';
import 'package:exercicio10/service/api.service.dart';
import 'package:exercicio10/ui/pages/search_model.page.dart';
import 'package:exercicio10/ui/widgets/card_list.dart';
import 'package:exercicio10/ui/widgets/search_box.widget.dart';
import 'package:exercicio10/util/vehicle.util.dart';
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

  String _getVehicleType() => VehicleUtil.getVehicleTypeName(args.vehicleType);

  _showBrandList() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int position) {
        Brand brand = _brandFiltredList[position];
        return CardList(
          title: brand.fipeName,
          onPress: () => _onPressBrand(brand.id.toString(), brand.fipeName),
        );
      },
      itemCount: _brandFiltredList.length,
    );
  }

  _onPressBrand(String id, String brandName) {
    return Navigator.of(context).pushNamed(SearchModelPage.route,
        arguments: SearchModelPageArgs(
            vehicleBrandId: id, vehicleBrandName: brandName));
  }

  _onChangeBrand(value) {
    setState(() {
      _brandFiltredList = _brandOriginalList
          .where((brand) =>
              brand.name.toUpperCase().contains(value.toString().toUpperCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getVehicleType()),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
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
