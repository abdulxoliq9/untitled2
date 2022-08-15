import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final String id= 'home_page';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final  _Key= GlobalKey<FormState>();
    String _mail, _password;

    void _doSignIn(){
      if(_Key.currentState!.validate()) {
        _Key.currentState!.save();
        print('all ok');
      }

    }
    return Scaffold(
      body: Form(
        key: _Key,
        child: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 50,vertical: 30),
            child: TextFormField(
              decoration: InputDecoration(labelText: 'email'),
              validator: (input)=>
              !((input!.contains('@')) && (input.contains('mail.')))?'Plaese enter a valid email':null,
              onSaved: (input)=>_mail=input!,
            ),
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 50),
              child: TextFormField(
                decoration: InputDecoration(labelText: 'password'),
                validator: (input)=>
                input!.length<6 ?'Plaese enter a valid password':null,
                onSaved: (input)=>_password=input!,
              ),
            ),
            FlatButton(
              color: Colors.cyan,
              onPressed: (){
                _doSignIn();
                },
              child: Text('sign in',),),
          ],
        ),
      ),

    );
  }
}
