import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travo/auth/auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String errorMessage = '';
  bool isLogin = true;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message!;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        displayName: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message!;
      });
    }
  }

  Widget _appname() {
    return Stack(
      children: [
        Text(
          'Travo',
          style: GoogleFonts.pacifico(
            color: Colors.deepOrangeAccent,
            fontWeight: FontWeight.bold,
            fontSize: 98.0,
          ),
        ),
        Text(
          'Travo',
          style: GoogleFonts.pacifico(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 102.0,
          ),
        ),
      ],
    );
  }

  Widget _formtitle() {
    return Text(
      isLogin ? 'Sign In' : 'Sign Up',
      style: const TextStyle(
        color: Color(0xff333333),
        fontWeight: FontWeight.bold,
        fontSize: 30.0,
      ),
    );
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }

  Widget _submitBtn() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 10,
          )),
      onPressed:
          isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
      child: Text(
        isLogin ? 'Login' : 'Register',
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _loginOrRegisterBtn() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                isLogin = !isLogin;
              });
            },
            child: Text(isLogin
                ? 'No account? Register now!'
                : 'Got an account? Sign in now!'),
          ),
        ],
      ),
    );
  }

  Widget _errorMessage() {
    if (errorMessage == '') {
      return Container();
    } else {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          errorMessage == '' ? '' : 'Hmm! $errorMessage',
          style: const TextStyle(
            color: Color.fromARGB(255, 255, 0, 0),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: Image.asset("assets/images/wallpaper.jpg").image,
                  fit: BoxFit.fill),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Center(
              child: _appname(),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  color: Colors.white,
                  margin: const EdgeInsets.all(20.0),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(children: <Widget>[
                      _formtitle(),
                      isLogin
                          ? const SizedBox()
                          : _entryField('Name', _nameController),
                      _entryField('Email', _emailController),
                      _entryField('Password', _passwordController),
                      _errorMessage(),
                      _loginOrRegisterBtn(),
                      _submitBtn(),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
