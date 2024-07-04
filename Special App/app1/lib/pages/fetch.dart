import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'editpage.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  late List data;
 
  Future getData() async {
    try {
      var response = await http
          .get(Uri.parse("http://192.168.12.218/applictions/app1/fetch.php"));
      if (response.statusCode == 202) {
        setState(() {
          data = json.decode(response.body);
        });
      }
      // print(data);
      // print(data[1]["name"]);
      // print(data.length);

      return "Success!";
    } catch (e) {
      print(e);
    }
  }

  Future deleteData(elId) async {
   late int upId;
    try {
      var url = Uri.parse("http://192.168.12.218/applictions/app1/delete.php");
      var resposnse = await http.post(url, body: {'id': elId});
      if (resposnse.statusCode == 203) {
        final snakbar = SnackBar(content: Text("Data Inserted"));
        ScaffoldMessenger.of(context).showSnackBar(snakbar);
        getData();
      }
    } catch (e) {
      print("Proble Somthing in Delete Methood");
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Listviews"), backgroundColor: Colors.blue),
      body: new Container(
          child: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  var upId = data[index]["id"];
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Editpage(data,index)));
                },
              ),
              trailing: InkWell(
                child: Icon(Icons.delete),
                onTap: () {
                  var elId = data[index]["id"];
                  deleteData(elId);
                },
              ),
              title: Text(data[index]["name"]),
              subtitle: Text(data[index]["email"]),
            ),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: getData,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
