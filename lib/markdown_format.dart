import 'package:design_patterns__decorator/input_format.dart';
import 'package:design_patterns__decorator/text_format.dart';

class MarkdownFormat extends TextFormat {
  MarkdownFormat({required InputFormat inputFormat})
      : super(inputFormat: inputFormat);

  @override
  String formatText(String text) {
    var text2 = inputFormat.formatText(text);
    var chunks = text2.split('|\n\n|');
    var text3 = <String>[];
    chunks.forEach((chunk) {
      var text3a = chunk;
      var allm = chunk.matchAsPrefix('|^#+|');
      if (allm == null) {
        text3a = text3a.replaceAllMapped('|^(#+)(.*?)\$|', (Match attribute) {
          var h = attribute[1]!.length;
          return '<h$h>${attribute[2]}<h$h>';
        });
      } else {
        text3a = '<p>$text3a</p>';
      }
      text3.add(text3a);
    });
    print(text3);
    var text4 = text3.join('\n\n');

    text4 = text4.replaceAllMapped('|__(.*?)__|', (m) {
      return '<strong>$m</strong>';
    });
    text4 = text4.replaceAllMapped("|\*\*(.*?)\*\*|", (m) {
      return '<strong>$m</strong>';
    });
    text4 = text4.replaceAllMapped("|_(.*?)_|", (m) {
      return '<em>$m</em>';
    });
    text4 = text4.replaceAllMapped("|\*(.*?)\*|", (m) {
      return '<em>$m</em>';
    });
    return text4;
  }
}
