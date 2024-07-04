import 'package:textapi/model.dart';
import 'package:http/http.dart' as http;
import 'package:textapi/model.dart';

class RemoteService {
  Future<List<Welcome>?> getData() async {
    var clint = http.Client();
    var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var response = await clint.get(url);
    if (response.statusCode == 200) {
      var json = response.body;
     return welcomeFromJson(json);
    }
  }
}
