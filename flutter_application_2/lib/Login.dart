import 'package:flutter/material.dart';
import 'package:flutter_application_2/Account.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    bool isObscure = true;
    return Scaffold(
      /*appBar: AppBar(
        title: const Text('Login'),
        
      ),*/
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'userID',
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  obscureText: isObscure,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                          // ignore: dead_code
                          isObscure ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Account()),
                        );
                      },
                      child: const Text('signin'))),
            ],
          ),
        ),
      ),
    );
    //throw UnimplementedError();
  }

  void setState(Null Function() param0) {}
}
