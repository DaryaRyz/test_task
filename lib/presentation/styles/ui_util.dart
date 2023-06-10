import 'package:easy_localization/easy_localization.dart';

class UiUtil{
  static String dateFormat(DateTime date){
    final result = DateFormat('dd MMMM, yyyy', 'ru').format(date);
    String month = result.replaceAll(RegExp(r'[^\D]'), '').trim();
    return result.replaceAll(month, month[0].toUpperCase() + month.substring(1));
  }
}