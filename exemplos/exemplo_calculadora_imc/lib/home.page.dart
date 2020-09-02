import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _infoResult = '';

  TextEditingController weightController = TextEditingController();

  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _refresh() {
    weightController.text = '';
    heightController.text = '';
    setState(() {
      _formKey = GlobalKey<FormState>();
    });
  }

  _calculate() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) / 100;

    double imc = weight / (height * height);

    setState(() {
      if (imc < 18.6) {
        _infoResult = 'Abaixo do Peso (${imc.toStringAsPrecision(4)})';
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoResult = 'Está no peso idela! (${imc.toStringAsPrecision(4)})';
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoResult = 'Levemente acima do peso (${imc.toStringAsPrecision(4)})';
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoResult = 'Obesidade de Grau 1 (${imc.toStringAsPrecision(4)})';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Calculadora IMC'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _refresh,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Icon(
                    Icons.person_outline,
                    size: 100,
                    color: Colors.green,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Peso (kg)',
                      labelStyle: TextStyle(color: Colors.green),
                    ),
                    style: TextStyle(color: Colors.green, fontSize: 20),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Insira seu peso!';
                      }
                      return null;
                    },
                    controller: weightController,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Altura (cm)',
                      labelStyle: TextStyle(color: Colors.green),
                    ),
                    style: TextStyle(color: Colors.green, fontSize: 20),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Insira seu peso!';
                      }
                      return null;
                    },
                    controller: heightController,
                  ),
                  SizedBox(height: 20),
                  RaisedButton(
                    padding: EdgeInsets.all(0),
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      color: Colors.green,
                      child: Center(
                        child: Text(
                          'Calcular',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _calculate();
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  Text(
                    _infoResult,
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
