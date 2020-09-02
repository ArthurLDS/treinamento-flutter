class OperationUtil {
  static const String MULTIPLICATION = 'x';
  static const String DIVISION = '/';
  static const String SUM = '+';
  static const String SUBTRACTION = '-';
  static const String PERCENT = '%';

  static double formatToDouble(String value) {
    return double.parse(value.replaceAll(',', '.'));
  }

  static String invertSignal(String value) {
    return _formatString((OperationUtil.formatToDouble(value) * -1).toString());
  }

  static String calculatePercent(String value) {
    return _formatString(
        (OperationUtil.formatToDouble(value) / 100).toString());
  }

  static calculate(double value1, double value2, String operationType) {
    double result = 0;
    switch (operationType) {
      case MULTIPLICATION:
        {
          result = value1 * value2;
        }
        break;
      case DIVISION:
        {
          result = value1 / value2;
        }
        break;
      case SUM:
        {
          result = value1 + value2;
        }
        break;
      case SUBTRACTION:
        {
          result = value1 - value2;
        }
        break;
    }
    return _formatString(result);
  }

  static _formatString(value) {
    value = value.toString();
    if (value.endsWith('.0')) value = value.replaceAll('.0', '');
    value = value.replaceAll('.', ',');
    return value;
  }
}
