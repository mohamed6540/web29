import 'package:admin/constants.dart';
import 'package:admin/controllers/MenuController.dart';
import 'package:admin/login.dart';
import 'package:admin/registration.dart';
import 'package:admin/screens/dashboard/components/departments.dart';
import 'package:admin/screens/dashboard/components/devices.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Admin Panel',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white),
          canvasColor: secondaryColor,
        ),
        home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuController(),
          ),
        ],
        child: MainScreen(),
      ),
        initialRoute: MyHomepage.id,
        routes: {
          MyHomepage.id: (context) => MyHomepage(),
          Registration.id: (context) => Registration(),
          Login.id: (context) => Login(),
          MainScreen.id: (context) => MainScreen(),
          Departments.id: (context) =>Departments(),
          Devices.id: (context) =>Devices()
        });
  }
}
class MyHomepage extends StatelessWidget {
  static const String id = "Homescreen";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                width: 100,
                child: Image.asset("assets/images/chat.jpg"),
              ),
            ),
            Text(
              'Mychat',
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        CustomButton(() {
          Navigator.of(context).pushNamed(Login.id);
        }, 'Login'),
        SizedBox(
          height: 10,
        ),
        CustomButton(() {
          Navigator.of(context).pushNamed(Registration.id);
        }, 'Register')
      ],
    ));
  }
}
class CustomButton extends StatelessWidget {
  final VoidCallback callback;
  final String text;

  const CustomButton(this.callback, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Material(
        color: Colors.black26,
        elevation: 6,
        borderRadius: BorderRadius.circular(30),
        child: MaterialButton(
          onPressed: callback,
          minWidth: 200,
          height: 45,
          child: Text(text),
        ),
      ),
    );
  }
}