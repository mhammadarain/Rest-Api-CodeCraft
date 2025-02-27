import 'package:api_practice_codecraft/models/logn_model.dart';
import 'package:api_practice_codecraft/screens/home_screen.dart';
import 'package:api_practice_codecraft/services/api_login_services.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  LoginModel loginModel = LoginModel();

  bool isReady = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login Screen",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueGrey,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 30,),
            TextField(
              controller: email,
              decoration: InputDecoration(
                hintText: "Enter Email"
              ),
            ),
            SizedBox(height: 10,),

            TextField(
              controller: password,
              decoration: InputDecoration(
                hintText: "Enter Password"
              ),
            ),

            SizedBox(height: 20,),

            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: (){
                    setState(() {
                      isReady = true;
                    });
                    //with model
                    // ApiLoginServices().loginWithModel(email.text.toString(), password.text.toString()).then((value){
                    //   setState(() {
                    //     loginModel = value!;
                    //     isReady = false;
                    //     Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen(
                    //         token: loginModel.token.toString())));
                    //   });
                    // });



                    //without model
                    ApiLoginServices().loginWithoutModel(email.text.toString(), password.text.toString()).then((value){
                      setState(() {
                        isReady = false;
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen(
                            //token: value["token"].toString()
                        )));
                      });
                    });

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey, // Change button color
                    foregroundColor: Colors.white, // Change text color
                  ),
                  child: isReady == true? Center(child: CircularProgressIndicator(color: Colors.white,),): Text("Login")),
            )
          ],
        ),
      ),
    );
  }
}
