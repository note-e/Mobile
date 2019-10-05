import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import '../Login.dart';


// User's Data Class
class _LoginData{
  String fullName = "";
  String email = "";
  String password = "";
}


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  /** Variables **/

  _LoginData Data = new _LoginData();

  final _formKey = GlobalKey<FormState>();

  final _fullNameController = new TextEditingController();
  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();




  // Text Widgets
  final _createAccount = new Text("Create Account,",
    style: new TextStyle(
      fontWeight: FontWeight.w900,
      fontFamily: 'Montserrat',
      fontSize: 35,
      color: Colors.black,
    ),
  );

  final _getStarted = new Text("Sign Up to get started!",
    style: new TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: 'Montserrat',
      fontSize: 25,
      color: Colors.grey,
    ),
  );

  final _alreadyMember = new Text("I'm already a member, ",
    style: new TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: 'Montserrat',
      fontSize: 18,
      color: Colors.black,
    ),
  );


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Container(
              color: Colors.white,
              child: new ListView(
                children: <Widget>[
                  new Form(
                    key: _formKey,
                    child: Center(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          // blank white space
                          SizedBox(height: 60),

                          // Create Account Text
                            SizedBox(
                              height: 50,
                              width: 300,
                              child: _createAccount,
                            ),


                          // Get Started Text
                          SizedBox(
                            height: 50,
                              width: 300,
                              child: _getStarted,
                          ),

                          // blank white space
                          SizedBox(height: 30),

                          // Full Name Text Form Field
                          SizedBox(
                            height: 90,
                            width: 300,
                            child: new TextFormField(
                              controller: _fullNameController,
                              cursorColor: Colors.amber,
                              decoration: InputDecoration(
                                labelText: "Full Name",
                                labelStyle: TextStyle(
                                  color: Colors.amber,
                                ),
                                hintText: "Enter Your Name",
                                border: OutlineInputBorder(
                                  gapPadding: 1.0,
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please Enter your name!";
                                }else{
                                  Data.fullName = value;
                                  return null;
                                }
                              },
                            ),
                          ),

                          // blank white space
                          SizedBox(height: 5),

                          // Email Text Form Field
                          SizedBox(
                            height: 90,
                            width: 300,
                            child: new TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Colors.amber,
                              decoration: InputDecoration(
                                labelText: "E-mail",
                                labelStyle: TextStyle(
                                  color: Colors.amber,
                                ),
                                hintText: "Enter Your E-mail Address",
                                border: OutlineInputBorder(
                                  gapPadding: 1.0,
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              ),
                              /**
                               * validator: (val) => !EmailValidator.validate(val, true)
                                  ? 'Not a valid email.'
                                  : null,
                                  onSaved: (val) => _email = val,
                               **/
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please Enter your E-mail Address!";
                                }
                                else if(!EmailValidator.validate(value)) {
                                  return "Not a valid email!";
                                }else{
                                  Data.email = value;
                                  return null;
                                }
                              },
                            ),
                          ),

                          // blank white space
                          SizedBox(height: 5),

                          // Password Text FormField
                          SizedBox(
                            height: 90,
                            width: 300,
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              cursorColor: Colors.amber,
                              decoration: InputDecoration(
                                labelText: "Password",
                                labelStyle: TextStyle(
                                  color: Colors.amber,
                                ),
                                hintText: "Enter Your Password",
                                border: OutlineInputBorder(
                                  gapPadding: 1.0,
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please Enter your password!";
                                }else{
                                  Data.password = value;
                                  return null;
                                }
                              },
                            ),
                          ),

                          // blank white space
                          SizedBox(height: 5),

                          // Sign Up Button
                          SizedBox(
                           height: 45,
                           width: 300,
                           child: new Material(
                               color: Colors.amber,
                               borderRadius: BorderRadius.circular(30.0),
                               child: MaterialButton(
                                   onPressed: () {
                                     if (_formKey.currentState.validate()) {
                                       setState(() {
                                          ///connect with api
                                       });
                                     }
                                   },
                                   child: Text(
                                     "SignUp",
                                     textAlign: TextAlign.center,
                                   )
                               )
                           ),
                          ),

                          // Already member, so go back to login Screen
                          SizedBox(
                            height: 90,
                            width: 300,
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Row(
                                children: <Widget>[
                                  _alreadyMember,
                                  InkWell(
                                    child: Text("Sign In",
                                       style: new TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Montserrat',
                                        fontSize: 18,
                                         color: Colors.amber,
                                         decoration: TextDecoration.underline,
                                       ),
                                    ),
                                    onTap: (){
                                        var route = new MaterialPageRoute(
                                          builder: (BuildContext context){
                                          return new LoginPage();
                                          });

                                          Navigator.of(context).push(route);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ),
      ),
      );
  }
}
