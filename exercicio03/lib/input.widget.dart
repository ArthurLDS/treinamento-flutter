import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  Color _colorRed = Color(0xFFE83F3F);
  Color _colorGray = Color(0xFF9B9B9B);
  Color _colorGrayDark = Color(0xFF3D4A5A);
  double _inputFontSizePlaceholder = 18;
  double _inputFontSizeText = 20;

  TextEditingController inputController;
  String textPlaceholder;
  TextInputType keyboardType;
  TextCapitalization textCapitalization;
  Function validator;
  bool required;
  bool obscureText;

  InputWidget({
    this.inputController,
    this.textPlaceholder,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.validator,
    this.required = false,
    this.obscureText = false,
  });

  _validate(value) {
    if (validator != null) {
      return validator(value);
    } else if (required) {
      return value.isEmpty ? 'Preecha o campo' : null;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      cursorColor: _colorRed,
      obscureText: obscureText,
      textCapitalization: textCapitalization,
      keyboardType: keyboardType,
      validator: (value) => _validate(value),
      decoration: InputDecoration(
        labelText: textPlaceholder,
        labelStyle: TextStyle(
          color: _colorGray,
          fontSize: _inputFontSizePlaceholder,
        ),
      ),
      style: TextStyle(
        color: _colorGrayDark,
        fontSize: _inputFontSizeText,
      ),
    );
  }
}
