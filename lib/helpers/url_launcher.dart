import 'package:url_launcher/url_launcher.dart';

launchWhatsapp(String url) async {
  Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}

launchLink(String link) async {
  Uri url = Uri.parse(link);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $link';
  }
}

makePhoneCall(String phoneNumber) async {
  String? formattedNumber;
  if (phoneNumber.startsWith("0")) {
    formattedNumber = phoneNumber = "+234${phoneNumber.substring(1)}";
  } else {
    formattedNumber = phoneNumber;
  }
  Uri url = Uri.parse("tel://$formattedNumber");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $phoneNumber';
  }
}

void openLocationInMap(double lng, double lat) async {
  final url =
      Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$lng');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

openEmailApp(String emailAddress) async {
  Uri url = Uri.parse("mailto:$emailAddress");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $emailAddress';
  }
}

launchSMSApp(String phoneNumber) async {
  Uri url = Uri.parse("sms:$phoneNumber");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $phoneNumber';
  }
}

Future<void> launchWeb(String data) async {
  Uri url = Uri.parse(data);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $data';
  }
}
