import 'package:app1/pages/fetch.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My App",
      home: MyBody(),
    );
  }
}

class MyBody extends StatefulWidget {
  MyBody({Key? key}) : super(key: key);

  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  final TextEditingController nameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController mobileC = TextEditingController();
  final TextEditingController ageC = TextEditingController();
  final TextEditingController cityC = TextEditingController();

  Future insertData() async {
   try {
      var url = Uri.parse("http://192.168.12.218/applictions/app1/inerst.php");
    var data = {
      'name': nameC.text,
      'email': emailC.text,
      'mobile': mobileC.text,
      'age': ageC.text,
      'city': cityC.text
    };
    var response = await http.post(url, body: data);
    if(response.statusCode==200){
      final snakbar  = SnackBar(content: Text("Data Inserted"));
      ScaffoldMessenger.of(context).showSnackBar(snakbar);
      nameC.clear();
      emailC.clear();
      mobileC.clear();
      ageC.clear();
      cityC.clear();

    }else{
      print("Problem Something");
    }
   } catch (e) {
     print(e);
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MYQll CURD"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: nameC,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Your Name"),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: emailC,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Your Email"),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: mobileC,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Your Mobile"),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: ageC,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Your Age"),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: cityC,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Your City"),
                ),
                SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  width: 150.0,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      insertData();
                    },
                    child: Text("Insert"),
                    style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        primary: Colors.blueAccent,
                        shape: StadiumBorder()),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        icon: Icon(Icons.people_alt),
        label: Text("Results"),
      ),
    );
  }
}
