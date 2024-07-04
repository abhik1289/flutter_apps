

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Text(
                "Blog App",
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      fontSize: 30.0, color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Text(
                "Log in to your accont",
                style: theme.textTheme.subtitle1,
              ),
            ),
            Container(
              child: Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Email"),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Password",
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.visibility))),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:8.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap:() => Navigator.pushNamed(context, "/ForgorPassword"),
                        child: Text("Forgot Password",textAlign: TextAlign.end,style: theme.textTheme.subtitle1,))),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: theme.primaryColor),
                          onPressed: () {},
                          child: Text(
                            "Submit",
                            style: theme.textTheme.subtitle2,
                          )),
                    ),
                  ),
                ],
              )),
            ),
            Padding(
              
              padding: const EdgeInsets.symmetric(vertical:18.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Don't have any account? ",style:theme.textTheme.subtitle1,), InkWell(
                  onTap: () => Navigator.pushNamed(context, "/SignUp"),
                  child: Text("Sign Up",style:GoogleFonts.lato(color: theme.primaryColor)))],
              ),
            )
          ],
        ),
        padding: const EdgeInsets.all(10.0),
      )),
    );
  }
}
