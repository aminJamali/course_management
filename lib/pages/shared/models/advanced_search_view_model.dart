import 'advanced_search_type.dart';

class AdvancedSearchViewModel {
  String? key;
  String? text;
  String? prefixText;
  String? startValue;
  String? endValue;
  AdvancedSearchType? type;
  bool show;
  AdvancedSearchViewModel(
      {final this.key,
      final this.text,
      final this.type = AdvancedSearchType.equals,
      final this.startValue,
      final this.endValue,
      final this.show = true});
}
