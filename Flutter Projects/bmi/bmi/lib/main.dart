import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "app",
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List gender = ["Male", "Female"];
  String dropdownValue = 'Male';
  TextEditingController _weightContrller = TextEditingController();
  TextEditingController _heightContrller = TextEditingController();
  TextEditingController _ageContrller = TextEditingController();
  double BMI = 0.0;
  String mass = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
        child: ListView(
          children: [
            Text(
              "BMI Calculator",
              style: TextStyle(fontSize: 25.0),
            ),
            Container(
              child: Column(
                children: [Text("Choose Your Gender"), dropDownMenu()],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Weight"),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 80.0,
                          child: TextFormField(
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: false, signed: false),
                            controller: _weightContrller,
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      int currentValue =
                                          int.parse(_weightContrller.text);
                                      setState(() {
                                        currentValue++;
                                        _weightContrller.text =
                                            currentValue.toString();
                                      });
                                    },
                                    icon: const Icon(Icons.add)),
                                prefixIcon: IconButton(
                                    onPressed: () {
                                      int currentValue =
                                          int.parse(_weightContrller.text);
                                      setState(() {
                                        currentValue--;
                                        _weightContrller.text =
                                            currentValue.toString();
                                      });
                                    },
                                    icon: const Icon(Icons.remove))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            width: 20.0,
                            child: Text("KG"),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Height"),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 80.0,
                          child: TextFormField(
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: false, signed: false),
                            controller: _heightContrller,
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      int currentValue =
                                          int.parse(_heightContrller.text);
                                      setState(() {
                                        currentValue++;
                                        _heightContrller.text =
                                            currentValue.toString();
                                      });
                                    },
                                    icon: const Icon(Icons.add)),
                                prefixIcon: IconButton(
                                    onPressed: () {
                                      int currentValue =
                                          int.parse(_heightContrller.text);
                                      setState(() {
                                        currentValue--;
                                        _heightContrller.text =
                                            currentValue.toString();
                                      });
                                    },
                                    icon: const Icon(Icons.remove))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            width: 20.0,
                            child: const Text("cm"),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Age"),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      keyboardType: const TextInputType.numberWithOptions(
                          decimal: false, signed: false),
                      controller: _ageContrller,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                              onPressed: () {
                                int currentValue =
                                    int.parse(_ageContrller.text);
                                setState(() {
                                  currentValue++;
                                  _ageContrller.text = currentValue.toString();
                                });
                              },
                              icon: const Icon(Icons.add)),
                          prefixIcon: IconButton(
                              onPressed: () {
                                int currentValue =
                                    int.parse(_ageContrller.text);
                                setState(() {
                                  currentValue--;
                                  _ageContrller.text = currentValue.toString();
                                });
                              },
                              icon: const Icon(Icons.remove))),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 12.0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50.0,
                  child: ElevatedButton(
                      onPressed: () {
                        //conver into m
                        int value = int.parse(_heightContrller.text);
                        double meterValue = value * 0.01;
                        double convertWeight =
                            double.parse(_weightContrller.text);
                        setState(() {
                          BMI = convertWeight / (meterValue * meterValue);
                           if (BMI < 18.5) {
                            mass = "Underweigh";
                        } else {
                          if(BMI<24.9){
                              mass = "Normal";
                          }else if(BMI<24.9){
                            mass = "Normal";
                          }else if(BMI<24.9){
                            mass = "Obese";
                          }
                        }
                        });
                       
                  
                      },
                      child: const Text("Calculated"))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Center(
                  child: Column(
                children: [
                  const Text(
                    "Your BMI is:",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 30.0),
                  ),
                  Text(
                    "${(BMI).toStringAsFixed(2)}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 30.0),
                  ),
                  Text("You are ${mass}")
                ],
              )),
            ),
          ],
        ),
      )),
    );
  }

  Widget dropDownMenu() {
    return DropdownButton(
      value: dropdownValue,
      icon: const Icon(Icons.expand_more),
      items: <String>['Male', 'Female']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
    );
  }
}
