

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
class ForgorPassword extends StatefulWidget {
  ForgorPassword({Key? key}) : super(key: key);

  @override
  State<ForgorPassword> createState() => _ForgorPasswordState();
}

class _ForgorPasswordState extends State<ForgorPassword> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "asset/emilC.png",
                fit: BoxFit.cover,
              ),
              Text(
                "Forgot \nPassword",
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        fontSize: 32.0,
                        color: theme.primaryColor,
                        fontWeight: FontWeight.w800)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  "Dont't worry !!It's happend.Please enter your email address with is asscioted in your accont",
                  style: theme.textTheme.subtitle1,
                ),
              ),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Email Address",
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.grey,
                        )),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: theme.primaryColor),
                          onPressed: () {
                            showBtnDilog();
                          },
                          child: Text(
                            "Submit",
                            style: theme.textTheme.subtitle2,
                          )),
                    ),
                  ),
                ],
              ))
            ],
          ),
        )),
      ),
    );
  }

  showBtnDilog() {
    final theme = Theme.of(context);

    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0))),
        context: context,
        builder: (context) => Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Enter Otp",style: theme.textTheme.headline5,),Padding(
                padding: const EdgeInsets.symmetric(vertical:8.0),
                child: Text("Enter your otp which is send on your email address",style: theme.textTheme.subtitle1,),
              ),
              Form(child: Column(children: [OTPTextField(
            length: 5,
            width: MediaQuery.of(context).size.width,
            textFieldAlignment: MainAxisAlignment.spaceAround,
            fieldWidth: 55,
            fieldStyle: FieldStyle.box,
            outlineBorderRadius: 5,
            style:const TextStyle(fontSize: 17),
            onChanged: (pin) {
              print("Changed: " + pin);
            },
            onCompleted: (pin) {
              print("Completed: " + pin);
            }),
           const SizedBox(height: 10.0,),
             SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: theme.primaryColor),
                          onPressed: ()=> Navigator.pushNamed(context, "/ChangePassword"),
                          child: Text(
                            "Submit",
                            style: theme.textTheme.subtitle2,
                          )),
                    ),
                  ),
            ],))
              ],),
              padding: const EdgeInsets.all(10.0),
              decoration:const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0))),
              height: 250.0,
            ));
  }
}
