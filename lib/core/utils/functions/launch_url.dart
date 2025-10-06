import 'package:bookly_app/core/utils/functions/custom_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl(context, String url) async {
  Uri uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    customSnackBar(context, 'Cannot Launch $url');
  }
}
