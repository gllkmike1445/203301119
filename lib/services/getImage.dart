import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> fetchRandomPhotoUrl() async {
  final response = await http.get(
    Uri.parse('https://api.pexels.com/v1/curated?per_page=1&page=1'),
    headers: {
      'Authorization': 'Bearer Ul8c2VQHeqcWx4yvBBfQAdB5EFdsJw6xrxj2iPf3lVTawpCXy3Bw2sjm',
    },
  );

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    final photoUrl = jsonResponse['photos'][0]['src']['medium'];
    return photoUrl;
  } else {
    throw Exception('Failed to load photo');
  }
}
