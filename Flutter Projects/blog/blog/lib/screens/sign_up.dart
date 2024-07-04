import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
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
                    decoration: const InputDecoration(labelText: "Name"),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration:const InputDecoration(
                        labelText: "Email",
                        ),
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
                  const SizedBox(
                    height: 10.0,
                  ),
                   TextFormField(
                    decoration: InputDecoration(
                        labelText: "Confirm Password",
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.visibility))),
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
                children: [Text("If you have a accont? ",style:theme.textTheme.subtitle1,), InkWell(
                  onTap: () => Navigator.pushNamed(context, "/SignIn"),
                  child: Text("Log In",style:GoogleFonts.lato(color: theme.primaryColor)))],
              ),
            )
          ],
        ),
      )),
    );
  }
}
