import 'package:hybridex4/hybridex4.dart' as hybridex4;
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() async {
  try {
    var url =
        Uri.parse('https://random-data-api.com/api/users/random_user?size=10');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      // print(jsonResponse);
      for (int i = 0; i < jsonResponse.length; i++) {
        var user = jsonResponse[i];
        print(
            'User ${i + 1}\'s uid: ${user['uid']}, first name: ${user['first_name']}, last name: ${user['last_name']}');
        print('');
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  } catch (e) {
    print('Error: $e');
  }
}
