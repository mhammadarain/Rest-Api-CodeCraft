import 'package:api_practice_codecraft/models/register_model.dart';
import 'package:api_practice_codecraft/screens/home_screen.dart';
import 'package:api_practice_codecraft/services/api_register_services.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  RegisterModel registerModel = RegisterModel();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isReady = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Register Screen"),
        backgroundColor: Colors.teal,
      ),

      body: Column(
        children: [
          TextField(
            controller: email,
            decoration: InputDecoration(hintText: "Enter Email"),
          ),

          TextField(
            controller: password,
            decoration: InputDecoration(hintText: "Enter Password"),
          ),

          SizedBox(
            height: 50,
            width: double.infinity,

            child: ElevatedButton(
                onPressed: (){
                  setState(() {
                    isReady = true;
                  });

                    ApiRegisterServices().register(email.text.toString(), password.text.toString()).then((value){
                      setState(() {
                        isReady = false;
                        registerModel =value!;
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen(
                          id: registerModel.id.toString(),
                          token: registerModel.token.toString(),
                        )));
                      });
                    });




                },
                child: isReady == true? Center(child: CircularProgressIndicator(color: Colors.white,),): Text("REGISTER")),
          )
        ],
      )
    );
  }
}
