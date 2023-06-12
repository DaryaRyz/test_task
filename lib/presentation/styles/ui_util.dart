import 'package:easy_localization/easy_localization.dart';

class UiUtil {
  static String dateFormat(DateTime date) {
    final result = DateFormat('dd MMMM, yyyy', 'ru').format(date);
    String month = result.replaceAll(RegExp(r'[^\D]'), '').trim();
    return result.replaceAll(month, month[0].toUpperCase() + month.substring(1));
  }

  static String priceParse(double? price) {
    if (price != null) {
      return '${price.toStringAsFixed(0)} ${'rub'.tr()}';
    }
    return 'noPrice'.tr();
  }

  static String weightParse(double? weight) {
    if (weight != null) {
      return '${weight.toInt()}г';
    }
    return 'noWeight'.tr();
  }

  static String getTotalPrice(double price) {
    final priceWithSpacers = NumberFormat("#,##0").format(price).replaceAll(',', ' ');
    return '${'pay'.tr()} $priceWithSpacers ${'rub'.tr()}';
  }
}
