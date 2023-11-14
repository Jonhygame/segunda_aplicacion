import 'package:flutter/material.dart';
import 'package:segunda_aplicacion/assets/global_values.dart';
import 'package:segunda_aplicacion/firebase/email_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final emailAuth = EmailAuth();
    GlobalValues.flagTheme.value = GlobalValues.prefs.getBool('teme') ?? false;
    GlobalValues.flagTheme.value = GlobalValues.teme.getBool('teme') ?? false;
    TextEditingController txtConUser = TextEditingController();
    TextEditingController txtConPass = TextEditingController();

    final txtUser = TextField(
      decoration: const InputDecoration(border: OutlineInputBorder()),
      controller: txtConUser,
    );

    final txtPass = TextField(
      decoration: const InputDecoration(border: OutlineInputBorder()),
      controller: txtConPass,
      obscureText: true,
    );

    final imgLogo = Container(
      width: 300,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                'http://2.bp.blogspot.com/-qVFkYqU-xJ8/TahMxxxxy9I/AAAAAAAAAB0/JRCcPDScQww/s1600/97-remeras-homero-simpson-350.jpg')),
      ),
    );

    final btnEntrar = FloatingActionButton.extended(
        icon: const Icon(Icons.login),
        label: const Text('Send'),
        onPressed: () {
          var email = txtConUser.text;
          var pass = txtConPass.text;
          emailAuth.login(emailLogin: email, pwdLogin: pass);
          //Navigator.pushNamed(context, '/dash');
        });

    final btnRegister = FloatingActionButton.extended(
        icon: const Icon(Icons.bookmark_add),
        label: const Text('Register :)'),
        onPressed: () {
          Navigator.pushNamed(context, '/register');
        });

    final session = Checkbox(
        value: GlobalValues.session.getBool('session') ?? false,
        activeColor: Colors.orange,
        onChanged: (bool? newbool) {
          setState(() {
            GlobalValues.session.setBool('session', newbool!);
          });
        });

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              opacity: .9,
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://3.bp.blogspot.com/-mzvJajghb3I/VsLT1mLAm6I/AAAAAAAAB0w/ABTEMT8oCoA/s1600/fondos%2Bde%2Bpantalla%2Bhd%2B.jpg')),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100.0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 260,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 151, 26, 26)),
                //color: Colors.blueGrey,
                child: Column(children: [
                  txtUser,
                  const SizedBox(height: 10),
                  txtPass,
                  btnRegister,
                  session,
                  const Text("Guardar session")
                ]),
              ),
              Container(
                  padding: const EdgeInsets.only(bottom: 200), child: imgLogo)
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: btnEntrar,
    );
  }
}
