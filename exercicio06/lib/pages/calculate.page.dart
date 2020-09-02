import 'package:exercicio06/components/button_calculate.component.dart';
import 'package:exercicio06/utils/color_util.dart';
import 'package:exercicio06/utils/operation_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatePage extends StatefulWidget {
  @override
  _CalculatePageState createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  String _result = '0';
  String _firstValue = '';
  String _secondValue = '';
  String _currentOperator = '';
  bool _isSecondValue = false;
  bool _hasResult = false;
  bool _isLastCharAnOperator = false;

  _addDigit(digit) {
    setState(() {
      if (_hasResult) {
        _clear();
      }

      if (_validateComma(digit)) {
        if (_result == '0') {
          if (digit == ',')
            _result += digit;
          else
            _result = digit;
        } else {
          _result += digit;
        }
      }

      if (_isSecondValue) {
        _secondValue = _result.substring(
            _result.indexOf(_currentOperator) + 1, _result.length);
      } else {
        _firstValue = _result;
      }
      _isLastCharAnOperator = false;
    });
  }

  _addOperation(operator) {
    setState(() {
      if (_isLastCharAnOperator || _result == '0') return;

      if (_hasResult) {
        _hasResult = false;
      }
      if (_isSecondValue) {
        String result = OperationUtil.calculate(
            OperationUtil.formatToDouble(_firstValue),
            OperationUtil.formatToDouble(_secondValue),
            _currentOperator);
        _firstValue = result;
        _result = result + operator;
      } else {
        _result += operator;
        _isSecondValue = true;
      }
      _currentOperator = operator;
    });
  }

  _clear() {
    setState(() {
      _result = '0';
      _firstValue = '';
      _secondValue = '';
      _currentOperator = '';
      _isSecondValue = false;
      _hasResult = false;
      _isLastCharAnOperator = false;
    });
  }

  _validateComma(String digit) {
    String value = _isSecondValue ? _secondValue : _firstValue;
    return !(value.contains(',') && digit == ",");
  }

  _calculateInvertOperation() {
    setState(() {
      if (OperationUtil.formatToDouble(_result) != 0)
        _result = OperationUtil.invertSignal(_result);
    });
  }

  _calculatePercent() {
    setState(() {
      _result = OperationUtil.calculatePercent(_result);
    });
  }

  _calculate() {
    setState(() {
      if (_firstValue.isNotEmpty && _secondValue.isNotEmpty) {
        String result = OperationUtil.calculate(
            OperationUtil.formatToDouble(_firstValue),
            OperationUtil.formatToDouble(_secondValue),
            _currentOperator);
        _result = result;
        _hasResult = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: ColorUtil.backgroundColor,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    _result,
                    style: TextStyle(color: Colors.white, fontSize: 75),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: 15
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      ButtonCalculate(
                        title: 'AC',
                        color: ColorUtil.grayLight,
                        textColor: Colors.black,
                        onPressed: _clear,
                      ),
                      SizedBox(width: 10),
                      ButtonCalculate(
                        title: '+/-',
                        color: ColorUtil.grayLight,
                        textColor: Colors.black,
                        onPressed: _calculateInvertOperation,
                      ),
                      SizedBox(width: 10),
                      ButtonCalculate(
                        title: '%',
                        color: ColorUtil.grayLight,
                        textColor: Colors.black,
                        onPressed: () => _calculatePercent(),
                      ),
                      SizedBox(width: 10),
                      ButtonCalculate(
                        title: '÷',
                        color: ColorUtil.primaryButtonColor,
                        onPressed: () => _addOperation(OperationUtil.DIVISION),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      ButtonCalculate(
                        title: '7',
                        color: ColorUtil.grayDark,
                        onPressed: () => _addDigit('7'),
                      ),
                      SizedBox(width: 10),
                      ButtonCalculate(
                        title: '8',
                        onPressed: () => _addDigit('8'),
                        color: ColorUtil.grayDark,
                      ),
                      SizedBox(width: 10),
                      ButtonCalculate(
                        title: '9',
                        color: ColorUtil.grayDark,
                        onPressed: () => _addDigit('9'),
                      ),
                      SizedBox(width: 10),
                      ButtonCalculate(
                        title: '×',
                        color: ColorUtil.primaryButtonColor,
                        onPressed: () =>
                            _addOperation(OperationUtil.MULTIPLICATION),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      ButtonCalculate(
                        title: '4',
                        color: ColorUtil.grayDark,
                        onPressed: () => _addDigit('4'),
                      ),
                      SizedBox(width: 10),
                      ButtonCalculate(
                        title: '5',
                        onPressed: () => _addDigit('5'),
                        color: ColorUtil.grayDark,
                      ),
                      SizedBox(width: 10),
                      ButtonCalculate(
                        title: '6',
                        onPressed: () => _addDigit('6'),
                        color: ColorUtil.grayDark,
                      ),
                      SizedBox(width: 10),
                      ButtonCalculate(
                        title: '-',
                        color: ColorUtil.primaryButtonColor,
                        onPressed: () =>
                            _addOperation(OperationUtil.SUBTRACTION),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      ButtonCalculate(
                        title: '1',
                        onPressed: () => _addDigit('1'),
                        color: ColorUtil.grayDark,
                      ),
                      SizedBox(width: 10),
                      ButtonCalculate(
                        title: '2',
                        onPressed: () => _addDigit('2'),
                        color: ColorUtil.grayDark,
                      ),
                      SizedBox(width: 10),
                      ButtonCalculate(
                        title: '3',
                        onPressed: () => _addDigit('3'),
                        color: ColorUtil.grayDark,
                      ),
                      SizedBox(width: 10),
                      ButtonCalculate(
                        title: '+',
                        color: ColorUtil.primaryButtonColor,
                        onPressed: () => _addOperation(OperationUtil.SUM),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      ButtonCalculate(
                        title: '0',
                        onPressed: () => _addDigit('0'),
                        color: ColorUtil.grayDark,
                        flex: 2,
                      ),
                      SizedBox(width: 10),
                      ButtonCalculate(
                        title: ',',
                        color: ColorUtil.grayDark,
                        onPressed: () => _addDigit(','),
                      ),
                      SizedBox(width: 10),
                      ButtonCalculate(
                        title: '=',
                        color: ColorUtil.primaryButtonColor,
                        onPressed: _calculate,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
