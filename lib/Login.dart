import 'package:flutter/material.dart';
import './ui/signup.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    final username = TextField(
      controller: usernameController,
      decoration: InputDecoration(
          hintText: "Username",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final password = TextField(
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginBtn = Material(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
            onPressed: () {
              print(usernameController.text);
              print(passwordController.text);
            },
            child: Text(
              "Login",
              textAlign: TextAlign.center,
            )
          )
        );

    final signUpBtn = Material(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
            onPressed: () {
              var route = new MaterialPageRoute(
                  builder: (BuildContext context){
                    return new SignUp();
                  });

              Navigator.of(context).push(route);
            },
            child: Text(
              "Sign Up",
              textAlign: TextAlign.center,
            )
        )
    );

    return Scaffold(
      body: Center(
        child: Container(
            color: Colors.white,
            child: new ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 300.0,
                      child: Image.asset(
                        "assets/note.jpg",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 90.0,
                      width: 300.0,
                      child: username,
                    ),
                    SizedBox(
                      height: 90.0,
                      width: 300.0,
                      child: password,
                    ),
                    SizedBox(
                      height: 60.0,
                      width: 150.0,
                      child: loginBtn,
                    ),
                    SizedBox(
                        height: 60.0,
                        width: 500.0,
                        child: Center(
                            child: Text(
                              '____________OR___________',
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 20.0,
                              ),
                            ))),
                    SizedBox(
                      height: 60.0,
                      width: 150.0,
                      child: signUpBtn,
                    ),
                  ],
                ),

              ],
            ),
        )



      ),
    );
  }
}
