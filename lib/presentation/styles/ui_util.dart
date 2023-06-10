import 'package:easy_localization/easy_localization.dart';

class UiUtil {
  static String dateFormat(DateTime date) {
    final result = DateFormat('dd MMMM, yyyy', 'ru').format(date);
    String month = result.replaceAll(RegExp(r'[^\D]'), '').trim();
    return result.replaceAll(month, month[0].toUpperCase() + month.substring(1));
  }

  static String priceParse(double? price) {
    if (price != null) {
      return '${price.toInt()} ₽';
    }
    return 'noPrice'.tr();
  }

  static String weightParse(double? weight) {
    if (weight != null) {
      return '${weight.toInt()}г';
    }
    return 'noWeight'.tr();
  }
}
