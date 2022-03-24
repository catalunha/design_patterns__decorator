import 'package:design_patterns__decorator/input_format.dart';

class TextFormat implements InputFormat {
  final InputFormat inputFormat;
  TextFormat({
    required this.inputFormat,
  });

  @override
  String formatText(String text) {
    return inputFormat.formatText(text);
  }
}
