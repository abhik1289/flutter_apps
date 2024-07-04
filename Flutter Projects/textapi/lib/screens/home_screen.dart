import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var data = [];
  bool loading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    try {
      var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          data = json.decode(response.body);
          if (data.length == null) {
            setState(() {
              loading = true;
            });
          }
        });
      } else {
         setState(() {
              loading = true;
            });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: Container(
          child:loading?Center(child: CircularProgressIndicator()) :ListView.builder(
              itemCount: data == null ? 0 : data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(data[index]['title']),
                    subtitle: Text(data[index]['body']),
                  ),
                );
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>  Navigator.pushNamed(context, "/user"),
        child: const Icon(Icons.person),
      ),
    );
  }
}
