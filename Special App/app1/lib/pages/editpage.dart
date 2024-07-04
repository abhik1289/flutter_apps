import 'package:app1/pages/fetch.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Editpage extends StatefulWidget {
  var data;
  var index;
  Editpage(this.data, this.index);

  @override
  _EditpageState createState() => _EditpageState(data, index);
}

class _EditpageState extends State<Editpage> {
  var data;
  var index;
  _EditpageState(this.data, this.index);

  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController mobileC = TextEditingController();
  TextEditingController ageC = TextEditingController();
  TextEditingController cityC = TextEditingController();
  bool editMode = false;

  @override
  void initState() {
    super.initState();
    if (index != null) {
      editMode = true;
      nameC.text = widget.data[widget.index]['name'];
      emailC.text = widget.data[widget.index]['email'];
      mobileC.text = widget.data[widget.index]['mobile'];
      ageC.text = widget.data[widget.index]['age'];
      cityC.text = widget.data[widget.index]['city'];
    }
  }

  Future updateData() async {
    if (editMode) {
      var url = Uri.parse("http://192.168.12.218/applictions/app1/update.php");
      var reponse = await http.post(url, body: {
        'id': widget.data[widget.index]['id'],
        'name': nameC.text,
        'email': emailC.text,
        'mobile': mobileC.text,
        'age': ageC.text,
        'city': cityC.text,
      });
      if (reponse.statusCode == 205) {
        final snakbar = SnackBar(content: Text("Data Updated"));
        ScaffoldMessenger.of(context).showSnackBar(snakbar);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        print("Upadet Problem");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Page"),
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
                      updateData();
                    },
                    child: Text("Update"),
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
    );
  }
}
