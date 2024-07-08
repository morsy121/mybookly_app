import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> lanchCustomUrl(context, String? url) async {
  if (url != null) {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Can Not Lanch $url"),
        ),
      );
    }
  }
}
