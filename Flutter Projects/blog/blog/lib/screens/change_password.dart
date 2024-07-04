import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePassword extends StatefulWidget {
  ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "asset/passrord.png",
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 15.0,
            ),
            Text(
              "Reset \nPassword",
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      fontSize: 32.0,
                      color: theme.primaryColor,
                      fontWeight: FontWeight.w800)),
            ),
              const SizedBox(
              height: 10.0,
            ),
               Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration:  InputDecoration(
                        hintText: "Email Address",
                        suffixIcon: IconButton(
                          onPressed: (){},
                         icon:const Icon(Icons.visibility ,
                          color: Colors.grey,
                        )),
                        ),
                  ),
                   const SizedBox(
              height: 10.0,
            ),
                     TextFormField(
                    decoration:  InputDecoration(
                        hintText: "Email Address",
                        suffixIcon: IconButton(
                          onPressed: (){},
                         icon:const Icon(Icons.visibility,
                          color: Colors.grey,
                        )),
                        ),
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
      ),
    );
  }
}
