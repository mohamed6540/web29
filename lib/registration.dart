import 'package:admin/screens/main/main_screen.dart';

import 'main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Registration extends StatefulWidget {
  static const String id = "Registration";

  @override
  _RegistrationState createState() => _RegistrationState();
}
class _RegistrationState extends State<Registration> {
  ///////////////
  String status = '';
  //String base64Image;
  //File tmpFile;
  String errMessage = 'Error Uploading Image';
  ///
  String email="";
  String password="";
  String userName="";
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth_aut = FirebaseAuth.instance;

  Future<void> registerUser() async {
    final user = (await FirebaseAuth_aut.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;
    Navigator.pushNamed(context, MainScreen.id);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyChat"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed:null,// chooseImage,
              child: Text('Choose Image'),
            ),
            SizedBox(
              height: 20.0,
            ),
          //  showImage(),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: null,//startUpload,
              child: Text('Upload Image'),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              status,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
             TextFormField(
               obscureText: true,
            onChanged: (value) => userName = value,
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: InputDecoration(
                hintText: "User Name",
                border: const OutlineInputBorder()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
              if (_formKey.currentState!.validate())
               {
    
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('wellcome $userName')));
                }
              },
              child: Text('Submit'),
            ),
          ),
          Expanded(
            child: Hero(
              tag: 'logo',
              child: Container(
                width: 120,
                child: Image.asset("assets/images/chat.jpg"),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) => email = value,
            decoration: InputDecoration(
                hintText: "Enter Your Email",
                border: const OutlineInputBorder()),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            obscureText: true,
            onChanged: (value) => password = value,
            autocorrect: false,
            decoration: InputDecoration(
                hintText: "Enter Your Password",
                border: const OutlineInputBorder()),
          ),
     SizedBox(
            height: 50,
          ),
          CustomButton(() async {
            await registerUser();
          }, "Regestrstion")
        ],
      ),
    );
  }
}
