import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

final openUrlProvider = Provider(
  (ref) => OpenUrlController(ref: ref),
);

class OpenUrlController {
  const OpenUrlController({required this.ref});

  final Ref ref;

  Future<void> openUrl({required String itemUrl}) async {
    final Uri url = Uri.parse(itemUrl);
    if(!await launchUrl(url)){
      throw Exception(
        'Urlが見つかりません',
      );
    }
  }
}
