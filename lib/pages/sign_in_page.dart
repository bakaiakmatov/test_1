import 'package:flutter/material.dart';
import 'package:test_1/services/web_services.dart';
import 'package:test_1/pages/cat_list_page.dart';

import 'cat_list_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final loginTEC = TextEditingController(text: 'test123');
  final passwordTEC = TextEditingController(text: 'qwer1234');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(42.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 271,
              ),
              TextField(
                controller: loginTEC,
                autocorrect: true,
                decoration: InputDecoration(
                  hintText: 'Login',
                  prefixIcon: Icon(Icons.login),
                  hintStyle: TextStyle(color: Colors.black54),
                  filled: true,
                  fillColor: Colors.white70,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.black54, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.green, width: 2),
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              TextField(
                controller: passwordTEC,
                autocorrect: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white70,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.black54, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.green, width: 2),
                  ),
                ),
              ),
              SizedBox(height: 32),
              
              Container(
                width: 330,
                height: 55,
                
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.cyan,
                  ),
                  onPressed: () async {
                    try {
                      await WebService().signIn(loginTEC.text, passwordTEC.text);
                      await Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => CatListPage()));
                    } on Exception catch (e) {
                      print(e);
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text('Проверьте правильность данных'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text(
                                'Закрыть',
                                style: TextStyle(),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                  },
                  child: Text('Войти',
                      style: TextStyle(fontSize: 20, color: Colors.black),),
                      
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
