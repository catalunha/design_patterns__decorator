import 'package:design_patterns__decorator/input_format.dart';
import 'package:design_patterns__decorator/text_format.dart';

class DangerousHtmlFilter extends TextFormat {
  final _dangerousTagPatterns = ["|<script.*?>([\s\S]*)?</script>|i"];
  final _dangerousAttributes = ['onclick', 'onkeypress'];

  DangerousHtmlFilter({required InputFormat inputFormat})
      : super(inputFormat: inputFormat);
  @override
  String formatText(String text) {
    var text2 = inputFormat.formatText(text);
    _dangerousTagPatterns.forEach((pattern) {
      text2 = text2.replaceAll(pattern, '');
    });
    _dangerousAttributes.forEach((attribute) {
      text2 = text2.replaceAllMapped('|<(.*?)>|', (Match attribute) {
        var result = text2.replaceAll('|$attribute=|i', '');
        return '<$result>';
      });
    });

    return text2;
  }
}
