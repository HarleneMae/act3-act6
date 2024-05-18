import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  var response = await http.get(Uri.parse('https://cat-fact.herokuapp.com/facts/random'));
  
  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body);
    
    if (data.containsKey('text')) {
      String catFact = data['text'];
      print('Cat Fact: $catFact');
    } else {
      print('No cat fact found in the response.');
    }
  } else {
    print('Failed to fetch data. Error: ${response.reasonPhrase}');
  }
}