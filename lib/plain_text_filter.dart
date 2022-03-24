import 'package:design_patterns__decorator/input_format.dart';
import 'package:design_patterns__decorator/text_format.dart';

class PlainTextFilter extends TextFormat {
  PlainTextFilter({required InputFormat inputFormat})
      : super(inputFormat: inputFormat);

  @override
  String formatText(String text) {
    var text2 = inputFormat.formatText(text);
    var text3 = text2.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ');
    return text3;
  }
}
