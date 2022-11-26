import 'package:flutter/material.dart';
import 'package:marvel_movies_app/screens/navBarPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override

  String username = "";
  String password = "";
  bool isLoginSuccess = false;


  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: Text('Login page',style: TextStyle(
              color: Colors.white,fontWeight: FontWeight.w600,fontFamily: 'Montserrat'
          ),),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.black87,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
              width: 250,
              height: 200,
              child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Marvel_Logo.svg/2560px-Marvel_Logo.svg.png")),
            Padding(padding: const EdgeInsets.only(bottom: 30)),
              _usernameField(),
              _passwordField(),
              Padding(padding: const EdgeInsets.only(bottom: 16)),
              _loginButton(context),

            ],
          ),
        ),
      ),
    );
  }

  Widget _usernameField(){
    return SizedBox(
      width: 700,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: TextFormField(
          style: TextStyle(color: Colors.white),
          onChanged: (value){
            username = value;
          },
          enabled: true,
          decoration: const InputDecoration(
            hintText: "Username",
            hintStyle: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white
            ),
            contentPadding: EdgeInsets.all(8),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
      ),
      )
    );
  }

  Widget _passwordField(){
    return Center(
      child: SizedBox(
        width: 700,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: TextFormField(
            style: TextStyle(color: Colors.white),
            onChanged: (value){
              password = value;
            },
            obscureText: true,
            enabled: true,
            decoration: const InputDecoration(
              hintText: "Password",
              hintStyle: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white
              ),
              contentPadding: EdgeInsets.all(8),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context){
    return SizedBox(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            padding: EdgeInsets.all(10.0),
            fixedSize: Size(190, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // <-- Radius
            ),
          ),
          child: Text("Login",style: TextStyle(fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Colors.white,)),
          onPressed: (){
            String text = "";
            if(username == "salsa" && password == "caca"){
              setState(() {
                text = "Login Success";
                isLoginSuccess = true;
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return NavBarPage();
                }));
              });
            }
            if(username != "salsa" && password != "caca"){
              setState(() {
                text = "Login Failed";
                isLoginSuccess = false;
              });
            }

            SnackBar snackBar = SnackBar(duration: const Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
              shape:
              RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
              backgroundColor: Colors.black,
              content: Text(text,style: TextStyle(fontFamily: 'Montserrat',color: Colors.white),),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            setState(() {
              isLoginSuccess = false;
            });
          },
        ),
      ),
    );
  }

}